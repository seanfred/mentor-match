require 'spec_helper'


feature "an admin edit a student survey" do
	let(:admin){Factory(:admin_user)}
	let!(:user){Factory(:confirmed_user)}
	let!(:student){Factory(:student, user: user)}


	scenario "admin edits a student survey" do
		@message = "Different dfd has been edited."
		sign_in_as!(admin)
		content "Students that still need mentors"
		click_link "Matt Tee"
		click_link "Edit"
	end

	scenario "student edits their survey" do
		@message = "Your profile has been edited."
		sign_in_as!(student.user)
		content "Welcome " + student.personal_first_name
		content "Mentor Profiles"
		click_link "Edit Your Profile"
	end

	after do
		# Form to Update
		select 'Ruby on Rails May/June', from: 'student_cf_class'
		fill 'personal_first_name', "Different"
		fill 'personal_last_name', "dfd"
		fill 'personal_where_you_from', "dfd"
		fill 'experience_university', "Bom"
		fill 'experience_degree', "Master Ninja"
		fill 'experience_other_degree', "Seahorse Riding"
		fill 'experience_job', "Superhero"
		fill 'experience_why_codefellows', "Because they're awesome"
		fill 'experience_project', "I once saved Bill Clinton"

		select 'Expert', from: 'student_skills_developer'
		select 'Very Familiar', from: 'student_skills_object'
		select 'Competent', from: 'student_skills_html_css'
		select 'Beginner', from: 'student_skills_javascript'
		select 'Expert', from: 'student_skills_java'
		select 'Competent', from: 'student_skills_cplusplus'
		select 'Expert', from: 'student_skills_c'
		select 'Competent', from: 'student_skills_ruby'
		select 'Expert', from: 'student_skills_python'
		select 'Competent', from: 'student_skills_php'
		select 'Expert', from: 'student_skills_net'
		select 'Expert', from:'student_skills_coffeescript'
		fill 'skills_other_coding', 'student_skills_other_coding'

		choose 'student_skills_selling_yourself_y'
		select 'Somewhat Familiar', from: 'student_skills_development_familiarity'
		choose 'student_skills_agile_development_experience_y'
		choose 'student_learning_self_taught_y'

		choose 'student_learning_books'
		choose 'student_learning_preference_groups'
		fill 'learning_extra_information', 'Other info'

		choose 'student_mentor_career_advice_4'
		choose 'student_mentor_skill_development_1'
		choose 'student_mentor_coding_question_tactics_3'
		choose 'student_mentor_soft_skills_1'
		choose 'student_mentor_interview_coaching_4'
		choose 'student_mentor_job_search_5'
		choose 'student_mentor_resume_development_5'
		choose 'student_mentor_github_account_development_3'
		choose 'student_mentor_selling_idea_4'
		select 'Startup', from: 'student_mentor_company_type'
		choose 'student_mentor_gender_n'
		fill 'mentor_extra_info', 'Other info'

		select 'Startup', from: 'student_goals_company_type'
		fill 'goals_after_codefellows', 'Go to Disneyland'
		fill 'goals_dream_job_title', 'Firefighter'
		fill 'goals_companies', 'Waste Management'
		fill 'goals_next_year', 'Fly a plane'
		fill 'goal_next_4_years', 'Brazil'
		choose 'student_goals_stay_seattle_y'
		fill 'linked_in', 'Linked In'
		fill 'goals_extra_info', 'extra'

		click_button 'Edit Survey'
		content @message
		no_content 'Matt Tee'
	end
end
