require 'spec_helper'

feature "a mentor ranks students they want to work with" do
  let!(:user){Factory(:confirmed_user)}
  let!(:user2){Factory(:confirmed_user)}
  let!(:mentor){Factory(:mentor, user: user, cf_class: "rails2")}
  let!(:student){Factory(:student, user: user2, cf_class: "rails2")}

  scenario "a student ranks mentors" do
    sign_in_as!(student.user)
    click_link "Mentor #" + mentor.id.to_s
    click_link "Add to Ranking"
    content 'Mentor #' + mentor.id.to_s + ' has been added to your rankings.'
  end

  scenario "a student views their rankings" do
    sign_in_as!(student.user)
    click_link "Mentor #" + mentor.id.to_s
    click_link "Add to Ranking"
    click_link "Dashboard"
    content 'Mentor #' + mentor.id.to_s
  end

end
