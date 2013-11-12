require 'spec_helper'

feature "an Admin sends a notification email" do
	let!(:admin){Factory(:admin_user)}
	let!(:user){Factory(:confirmed_user)}
	let!(:mentor){Factory(:mentor, user: user)}
	let!(:user2){Factory(:confirmed_user)}
	let!(:student){Factory(:student, user: user2)}

	before do
		ActionMailer::Base.deliveries.clear
		visit '/'
		find "#login"
		sign_in_as!(admin)
		click_link 'Notifications'
		click_link 'Notify'
	end

	scenario "an Admin sends a notification email to an admin" do
		check_me "#mentor_ids_"
		fill 'subject', "Get er done"
		fill 'message', "Really cool message"
		click_button 'Notify'
		open_email mentor.user.email, with_subject: "Get er done"
		current_email.should have_content('Really cool message')
	end

	scenario "an Admin sends a notification email to a student" do
		check_me "#student_ids_"
		fill 'subject', "Get er done"
		fill 'message', "Really cool message"
		click_button 'Notify'
		open_email student.user.email, with_subject: "Get er done"
		current_email.should have_content('Really cool message')
	end
end
