require 'spec_helper'

feature "An Admin Edits a Mentor Profile" do
	let!(:admin){Factory(:admin_user)}
	let!(:user){Factory(:confirmed_user)}
	let!(:mentor){Factory(:mentor, user: user)}

	before do
		visit '/'
		click_id "#login"
	end

	scenario "Admin edits Mentor from Database" do
		@message = "John Thomas's profile has been updated"
		sign_in_as!(admin)
		content "Mentors that still need mentees"
		click_link "Butler Price"
		click_link "Edit"
	end

	scenario "A Mentor edits their profile" do
		@message = "Your profile has been edited."
		sign_in_as!(mentor.user)
		content "View Mentee Profiles"
		click_link "Edit Your Profile"
	end

	after do
		# Form that needs to be changed
		fill "personal_first_name", "John"
		fill "personal_last_name", "Thomas"
		fill "personal_why_mentor", "Because I'm great"
		fill "personal_knowledge_impart", "Great knowledge"

		fill "career_information", "Some Information"
		fill "career_job_title", "CEO"
		fill "career_company_private", "Octomania"
		select "Startup", :from => "mentor_career_company_type"

		fill 'experience_university', with: "Bom"
		fill 'experience_degree', "Master Ninja"
		fill 'experience_other_degree', "Seahorse Riding"

		select 'Very Able', :from => 'mentor_mentee_skills_developer'
		select 'Somewhat Able', :from => 'mentor_mentee_skills_html_css'
		select 'Not Able', :from => 'mentor_mentee_skills_javascript'
		select 'Very Able', :from => 'mentor_mentee_skills_java'
		select 'Somewhat Able', :from => 'mentor_mentee_skills_cplusplus'
		select 'Very Able', :from => 'mentor_mentee_skills_c'
		select 'Somewhat Able', :from => 'mentor_mentee_skills_ruby'
		select 'Not Able', :from => 'mentor_mentee_skills_python'
		select 'Not Able', :from => 'mentor_mentee_skills_php'
		select 'Very Able', :from => 'mentor_mentee_skills_net'
		select 'Not Able', :from =>'mentor_mentee_skills_coffeescript'
		fill 'mentee_skills_other_coding', "asdfdas"

		choose 'mentor_skills_career_advice_3'
		choose 'mentor_skills_development_4'
		choose 'mentor_skills_coding_question_tactics_5'
		choose 'mentor_skills_soft_skills_4'
		choose 'mentor_skills_interview_coaching_3'
		choose 'mentor_skills_job_search_5'
		choose 'mentor_skills_resume_development_3'
		choose 'mentor_skills_github_account_development_3'
		choose 'mentor_skills_selling_idea_4'
		choose 'mentor_mentee_gender_n'
		fill 'mentee_extra_info', 'Other info'

		click_button "Update Profile"
		content @message
		content "John Thomas"
		content "Because I'm great"
		content "Some Information"
		content "Octomania"
		no_content("Butler Price")
	end
end
