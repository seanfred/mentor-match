require 'spec_helper'

feature "A mentor adds his profile information" do
	let!(:user){Factory(:user, role: "mentor")}

	before do
		ActionMailer::Base.deliveries.clear
	end

	scenario "Mentor adds his profile information" do
		sign_in_as!(user)
		visit new_mentor_path
		fill_in "personal_first_name", with: "John"
		fill_in "personal_last_name", with: "Thomas"
		fill_in "personal_why_mentor", with: "Because I'm great"
		fill_in "personal_knowledge_impart", with: "Great knowledge"

		fill_in "career_information", with: "Some Information"
		fill_in "career_job_title", with: "CEO"
		fill_in "career_company_private", with: "Octomania"
		select "Startup", from: "mentor_career_company_type"

		fill_in 'experience_university', with: "Bom"
		fill_in 'experience_degree', with: "Master Ninja"
		fill_in 'experience_other_degree', with: "Seahorse Riding"

		select 'Very Able', from: 'mentor_mentee_skills_developer'
		select 'Somewhat Able', from: 'mentor_mentee_skills_html_css'
		select 'Not Able', from: 'mentor_mentee_skills_javascript'
		select 'Very Able', from: 'mentor_mentee_skills_java'
		select 'Somewhat Able', from: 'mentor_mentee_skills_cplusplus'
		select 'Very Able', from: 'mentor_mentee_skills_c'
		select 'Somewhat Able', from: 'mentor_mentee_skills_ruby'
		select 'Not Able', from: 'mentor_mentee_skills_python'
		select 'Not Able', from: 'mentor_mentee_skills_php'
		select 'Very Able', from: 'mentor_mentee_skills_net'
		select 'Not Able', from:'mentor_mentee_skills_coffeescript'
		fill_in 'mentee_skills_other_coding', with: "asdfdas"

		choose 'mentor_skills_career_advice_4'
		choose 'mentor_skills_development_4'
		choose 'mentor_skills_coding_question_tactics_3'
		choose 'mentor_skills_soft_skills_2'
		choose 'mentor_skills_interview_coaching_4'
		choose 'mentor_skills_job_search_5'
		choose 'mentor_skills_resume_development_1'
		choose 'mentor_skills_github_account_development_4'
		choose 'mentor_skills_selling_idea_4'
		choose 'mentor_mentee_gender_n'
		fill_in 'mentee_extra_info', with: 'Other info'

		select "Ruby on Rails July/August", from: "mentor_cf_class"
		click_button "Submit Profile"
		page.should have_content('Thank You!')

		open_email user.email, with_subject: 'Mentor Match Confirmation'
		current_email.should have_content('Thanks for filling out your survey.' + ' You will be paired soon. Watch out for that email soon.')
	end
end