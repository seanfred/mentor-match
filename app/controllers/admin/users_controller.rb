class Admin::UsersController < ApplicationController
  before_filter :authorize_admin!

  def index
    @studentnomentors = Student.joins(:user).where("mentor_id is NULL AND approval = 1").page(params[:page]).per(50).order(:personal_first_name)
    @studentsall  = Student.joins(:user).where("approval = ?", 1).page(params[:page]).per(50).order(:personal_first_name)
    @mentornostudents = Mentor.joins(:user).joins("LEFT OUTER JOIN 'students' ON students.mentor_id = mentors.id").where("students.mentor_id is NULL AND approval = 1").page(params[:page]).per(50).order(:personal_first_name)
    @mentorsall = Mentor.joins(:user).where("approval = ?", 1).page(params[:page]).per(50).order(:personal_first_name)
  end

  def pending_users
    @pending_users = User.where("approval = ?", 0).page(params[:page]).per(50).order(:created_at)
  end

  def approve
    approve_ids = params[:approve_ids]
    deny_ids = params[:deny_ids]

    if deny_ids.present?
      deny_users(deny_ids)
    end

    if approve_ids.present?
      approve_users(approve_ids)
    end
    @@message ||= "You didn't select anything!"
    flash[:notice] = @@message
    redirect_to "/pending"
  end

  def pair
    @students  = Student.joins(:user).where("approval = ?", 1).page(params[:page]).per(50).order(:personal_first_name)
    @mentornostudents = Mentor.joins(:user).joins("LEFT OUTER JOIN 'students' ON students.mentor_id = mentors.id").where("students.mentor_id is NULL AND approval = 1").page(params[:page]).per(50).order(:personal_first_name)
  end

  #still need to refactor this method
  def paired

    ids = params[:mentor_ids]

    pair_ids(ids)
    @@message ||= "Mentors and mentees have been paired and notifications sent"
    flash[:notice] = @@message
    redirect_to admin_users_path
  end

  private

  # for approving and denying users

  def deny_users(deny_ids)
    deny_ids.each do |id|
      user = User.find(id)
      if user.update_attributes({approval: -1}, as: :admin)
        @@message = "The users have been denied."
      end
    end
  end

  def approve_users(approve_ids)
    approve_ids.each do |id|
      @user = User.find(id)
      if @user.update_attributes({approval: 1}, as: :admin)
          Notifier.notification((@user.mentor || @user.student),
              "Mentor Match Approval",
              "You have been approved by Mentor Match." +
              " You may now login and view possible matches.").deliver
          @@message = "Your approvals and denials have gone through."
      else
          @@message = "Sorry, there was a problem and approvals did not go through."
      end
    end
  end

  # for pairing students and mentors
  def pair_ids(ids)
    ids.each do |id|

      #splits the mentor ids and the students
      ids = id.split("-")

      mentorid = ids[0]
      studentid = ids[1]

      @student = Student.find(studentid)

      past_mentor_id = @student.mentor.try(:id)

      if mentorid == 'remove'
        remove_mentor(@student, past_mentor_id)
        next
      end

      if @student.update_attributes(mentor_id: mentorid)
        if @student.mentor_id.present?
          notify_pair(@student, past_mentor_id)
        end
        @@message = "Mentors and mentees have been paired and notifications sent"
      else
        @@message = "Sorry, there was a problem, and mentors and mentees could not be paired"
      end
    end
  end

  def remove_mentor(student, past_mentor_id)
    student.update_attributes(mentor_id: nil, notify: false)
    if past_mentor_id.present?
      @@message = "The mentors are no longer paired with students."
    end
  end

  def notify_pair(student, past_mentor_id)
    student = @student

    unless past_mentor_id == @student.mentor_id
      mentor_first = @student.mentor.personal_first_name
      mentor_last = @student.mentor.personal_last_name
      mentor_email = @student.mentor.user.email

      student_first = @student.personal_first_name
      student_last = @student.personal_last_name
      student_email = @student.user.email

      if @student.notify == false
        @student.update_attributes(notify: true)
        # Dry Later
        Notifier.notification(@student,
          "Mentor Match Paired",
          "You have been paired with #{mentor_first} #{mentor_last}." +
          " You can contact them at #{mentor_email}.").deliver

        Notifier.notification(@student.mentor,
          "Mentor Match Paired",
          "You have been paired with #{student_first} #{student_last}." +
          " You can contact them at #{student_email}").deliver
      end
    end
  end
 end
