require 'spec_helper'

feature "An Admin Deletes A Mentor" do
	let!(:admin){Factory(:admin_user)}
	let!(:user){Factory(:confirmed_user)}
	let!(:mentor){Factory(:mentor, user: user)}

	scenario "Admin deletes Mentor from Database" do
		sign_in_as!(admin)
		content "Mentors that still need mentees"
		click_link "Butler Price"
		click_link "Delete"
		content "Butler Price has been removed from the database."
	end

	scenario "A Mentor deletes their Profile" do
		sign_in_as!(mentor.user)
		content "View Mentee Profiles"
		click_link "Delete Your Profile"
		content "You have been deleted from our database"
	end

end
