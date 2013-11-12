class ApplicationController < ActionController::Base
  protect_from_forgery

  def user
    if current_user.student
      @student_user = current_user.student
    elsif current_user.mentor
      @mentor_user = current_user.mentor
    elsif current_user.admin
      @admin_user = current_user.admin
    end
  end

  def authorize_admin!
    authenticate_user!
    unless current_user.admin
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end

  def current_user_approved?
    unless current_user.approval==1 || current_user.admin?
      flash[:notice] = "Sorry, you must be approved to access this page."
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(users)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => '/')
    if request.referer == sign_in_url
      super
    elsif current_user.admin == true
      admin_users_path
    elsif current_user.approval==1 && current_user.mentor.present?
      mentors_path
    elsif current_user.approval==1 && current_user.student.present?
      students_path
    elsif current_user.role == 'mentor' && current_user.mentor.blank?
      new_mentor_path
    elsif current_user.role == 'student' && current_user.mentor.blank?
      new_student_path
    else
      "/needsapproval"
    end
  end
end
