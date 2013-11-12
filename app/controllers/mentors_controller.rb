class MentorsController < ApplicationController
  before_filter :authorize_admins_or_students_or_a_mentor!,
                  only:   [ :show]
  before_filter :authorize_admins_or_a_mentor!,
                  only:   [ :edit,
                            :update,
                            :destroy]
  before_filter :authenticate_user!
  before_filter :current_user_approved?,
                  except: [ :new,
                            :create]

  def index
    if current_user.mentor
      @user = user
      @studentsinterest = Student.joins(:user).where("approval = 1 AND goals_companies=?", @user.career_company_private).order(:id).page(params[:page]).per(20)
      @students = Student.joins(:user).where("approval = 1").order(:id).page(params[:page]).per(20)
      @paired_students = user.students.order(:personal_first_name).page(params[:page]).per(20)
      @current_mentees = Student.joins(:user).where("approval = 1 AND mentor_id = ?", @user.id).order(:id).page(params[:page]).per(20)
      @rankings = current_user.mentor.rankings.order(:rank)
      @classes = [["Amazon", "Interested in #{user.career_company_private.capitalize}", "company"], ["rails2", "From June Class"], ["rails3", "From July Class"]]
      if params[:company]
        @students = Student.joins(:user).where("approval = 1 AND goals_companies = ?", params[:sort]).order(:id)
      elsif params[:sort] == 'all'
        @students = Student.joins(:user).where("approval= ?", 1).order(:id)
      elsif params[:sort]
        @students = Student.joins(:user).where("approval = 1 AND cf_class = ?", params[:sort]).order(:id)
      end
    else
      flash[:alert] = "You don't have access to that page."
      redirect_to root_path
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    if current_user.role == "mentor" && !current_user.mentor
      @mentor = Mentor.new
    else
      redirect_to mentors_path
    end
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    if current_user.role == "mentor" && !current_user.mentor
      @mentor = Mentor.new(params[:mentor])
      @mentor.user_id = current_user.id

      if @mentor.save
        redirect_to '/thanks'
      else
        flash[:alert] = 'Sorry, there was a problem. ' +
                        'Please make sure your first name, last name, job title, company, company type ' +
                        '& email are all filled in.'
        render :action => "new"
      end
    else
      mentors_path
    end
  end

  def update
    @mentor = Mentor.find(params[:id])

    if user == @mentor || current_user.admin
      update_mentor(@mentor)
    else
      flash[:notice] = "You can only edit your own profile."
      redirect_to mentors_path
    end
  end

  def destroy
    @mentor = Mentor.find(params[:id])
    firstname = @mentor.personal_first_name
    lastname = @mentor.personal_last_name
    if current_user.mentor == @mentor
      current_user.destroy
      redirect_to root_path,
        :notice => "You have been deleted from our database"
    else
      @mentor.user.destroy
      redirect_to admin_users_path,
        :notice => "#{firstname} #{lastname} has been removed from the database."
    end
  end

  def rankings
    @rankings = current_user.mentor.rankings.order(:rank)
  end

  private

  def find_mentor
    @mentor = Mentor.find(params[:id])
  end

  def authorize_admins_or_a_mentor!
    find_mentor
    unless current_user.admin? || user == @mentor
      redirect_to root_path
    end
  end

  def authorize_admins_or_students_or_a_mentor!
    find_mentor
    authenticate_user!
    unless current_user.admin? || current_user.student.present? || current_user.mentor == @mentor
      flash[:alert] = "You cannot access this page!"
      redirect_to root_path
    end
  end

  # update mentor
  def update_mentor(mentor)
    if mentor.update_attributes(params[:mentor])
      set_update_message(mentor)
      flash[:notice] = @@message
      redirect_to mentor_path(@mentor)
    else
      flash[:notice] =  'There was a problem! ' +
                      'Please make sure your first name, last name, job title, company, company type ' +
                      '& email are all filled in below.'
      render :action => "edit"
    end
  end

  def set_update_message(mentor)
    if user == mentor
      @@message = "Your profile has been edited."
    else
      @@message = mentor.personal_first_name + ' ' + mentor.personal_last_name + "'s profile has been updated"
    end
  end
end
