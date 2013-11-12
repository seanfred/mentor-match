require 'spec_helper'

feature "Admin pairs the student and mentors" do
	let!(:admin){Factory(:admin_user)}
	let!(:user2){Factory(:confirmed_user)}
	let!(:mentor){Factory(:mentor, user: user2, cf_class: "rails2")}
	let!(:user){Factory(:confirmed_user)}
	let!(:student){Factory(:student, user: user, cf_class: "rails2")}

	before do
		ActionMailer::Base.deliveries.clear
	end

	scenario "Admin pairs students together" do
		visit '/'
		click_id "#login"
		sign_in_as!(admin)
		click_link 'Pair!'
		content "Matt Tee"
		select "Butler Price", :from => "mentor_ids[]"
		click_button "Pair"
		content "Mentors and mentees have been paired and notifications sent"

		student2 = Student.find(student.id)
		message =  "You have been paired with Butler Price. You can contact them at " + mentor.user.email + "."
		open_email student.user.email, with_subject: "Mentor Match Paired"
		current_email.should have_content(message)
	end
end
