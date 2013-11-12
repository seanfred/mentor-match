require 'spec_helper'

feature "a student fills out survey" do
	let!(:user){Factory(:user, role: "student")}

	before do
		ActionMailer::Base.deliveries.clear
	end

	scenario "student fills out survey" do
		sign_in_as!(user)
		visit new_student_path
		select 'Ruby on Rails May/June', from: 'student_cf_class'
		fill 'personal_first_name', "Fud"
		fill 'personal_last_name', "Helser"
		fill 'personal_where_you_from', "Alaska"
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
		fill 'skills_other_coding', "Coolio awesome faced man"


		choose 'student_skills_selling_yourself_y'
		select 'Somewhat Familiar', from: 'student_skills_development_familiarity'
		choose 'student_skills_agile_development_experience_y'
		choose 'student_learning_self_taught_y'

		choose 'student_learning_books'
		choose 'student_learning_preference_groups'
		fill 'learning_extra_information', 'Other info'

		choose 'student_mentor_career_advice_3'
		choose 'student_mentor_skill_development_2'
		choose 'student_mentor_coding_question_tactics_4'
		choose 'student_mentor_soft_skills_5'
		choose 'student_mentor_interview_coaching_2'
		choose 'student_mentor_job_search_5'
		choose 'student_mentor_resume_development_3'
		choose 'student_mentor_github_account_development_4'
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

		click_button 'Submit Profile'
		content'Thank You!'

		open_email user.email, with_subject: 'Mentor Match Confirmation'
		current_email.should have_content('Thanks for filling out your survey.' +
			' You will be paired soon. Watch out for that email soon.')

	end
end
