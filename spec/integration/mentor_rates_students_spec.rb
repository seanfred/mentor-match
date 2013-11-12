require 'spec_helper'

feature "a mentor ranks students they want to work with" do
  let!(:user){Factory(:confirmed_user)}
  let!(:user2){Factory(:confirmed_user)}
  let!(:mentor){Factory(:mentor, user: user)}
  let!(:student){Factory(:student, user: user2)}

  scenario "a mentor ranks students" do
    sign_in_as!(mentor.user)
    click_link "Student #" + student.id.to_s
    click_link "Add to Ranking"
    content 'Student #' + student.id.to_s + ' has been added to your rankings.'
  end

  scenario "a mentor views their rankings" do
    sign_in_as!(mentor.user)
    click_link "Student #" + student.id.to_s
    click_link "Add to Ranking"
    click_link "Dashboard"
    content 'Student #' + student.id.to_s
  end

end
