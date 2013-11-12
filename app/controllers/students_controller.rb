	class StudentsController < ApplicationController
  before_filter :authorizes_admins_or_mentors_or_a_student!,
  									only: 	[	:show]
	before_filter :authorizes_admins_or_a_student!,
										only: 	[	:edit,
															:update,
															:destroy]
	before_filter :authenticate_user!
	before_filter :current_user_approved?,
										except: [	:new,
															:create,
															:thanks]

	def index
		if current_user.student
	    @user = user
	    @cf_class = @user.cf_class
	    @mentors = Mentor.joins(:user).where("approval = 1 AND cf_class = ?", @cf_class).order(:id)
	    @mentor = @user.mentor
      @rankings = current_user.student.studentrankings.order(:rank)
	    @companies = []
	    @mentors.each do |mentor|
	    	company = mentor.career_company_private
	    	unless @companies.include?(company)
	    		@companies << mentor.career_company_private
	    	end
	    end
			if params[:sort] == 'all'
				@mentors = Mentor.joins(:user).where("approval = 1 AND cf_class = ?", @cf_class).order(:id)
			elsif params[:sort]
				@mentors = Mentor.joins(:user).where("approval = 1 AND career_company_private = ? AND cf_class = ?", params[:sort], @cf_class).order(:id)
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

	def new
		if current_user.role == "student" && !current_user.student
			@student = Student.new
		else
			redirect_to students_path
		end
	end

	def create
		if current_user.role == "student" && !current_user.student
			@student = Student.new(params[:student])
			@student.user_id = current_user.id
			if @student.save
				redirect_to '/thanks'
			else
				flash[:alert] = 'Sorry, there was a problem. ' +
												'Please make sure your first name, last name, & email are all filled in.'
				render :action => "new"
			end
		else
			redirect_to students_path
		end
	end

	def thanks
	end

	def update
		@student = Student.find(params[:id])

		if current_user.student == @student || current_user.admin?
			update_student(@student)
		else
			flash[:notice] = "You can only edit your own profile."
			redirect_to students_path
		end
	end

	def destroy
		@student = Student.find(params[:id])
		firstname = @student.personal_first_name
		lastname = @student.personal_last_name
		if current_user.student == @student
			current_user.student.destroy
 			flash[:notice] = "You have been deleted from our database."
			redirect_to root_path
		else
			@student.user.destroy
			flash[:notice] = "#{firstname} #{lastname} has been removed from the database."
			redirect_to admin_users_path
		end
	end

  def rankings
    @rankings = current_user.student.studentrankings.order(:rank)
  end

	private

	def find_student
		@student = Student.find(params[:id])
	end

	def authorizes_admins_or_a_student!
		find_student
		unless current_user.admin? || user == @student
			flash[:alert] = "You must be a student or admin to do that!"
			redirect_to root_path
		end
	end

  def authorizes_admins_or_mentors_or_a_student!
  	find_student
    authenticate_user!
    unless current_user.admin? || current_user.mentor.present? || current_user.student == @student
			flash[:alert] = "You must be a mentor or admin to do that!"
      redirect_to root_path
    end
  end

  # update student's profile
  def update_student(student)
		if student.update_attributes(params[:student])
			if user == student
				message = "Your profile has been edited."
			else
				message = student.personal_first_name + ' ' + student.personal_last_name + ' has been edited.'
			end
			flash[:notice] = message
			redirect_to student_path(student)
		else
			flash[:notice] = 	'There was a problem!' +
												'Please make sure your first name, last name, & email are all filled in.'
			render :action => "edit"
		end
  end
end
