class HomeController < ApplicationController
	def index
    if current_user && current_user.approval==1 && current_user.mentor
      redirect_to mentors_path
    elsif current_user &&  current_user.approval==1 && current_user.student
      redirect_to students_path
    end
	end

  def need_approval
  end
end