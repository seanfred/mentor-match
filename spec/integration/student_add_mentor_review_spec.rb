=begin
require 'spec_helper'

feature "Student fills out mentor review" do
	let!(:student){Factory(:student)}

	scenario "Student fills out a mentor review" do
		sign_in_as!(student)
		choose "rating_availability_10"
		choose "rating_helpfulness_9"
		choose "rating_personality_fit_8"
		choose "rating_overall_experience_8"
		fill "mentor_overall_experience", "My experience was awesome"
		fill "mentor_system_improvement", "None"
		click_button "Review Mentor"
		content "Thanks for your review! " +
						"We hope you enjoyed your " +
						"experience with Codefellows!"
	end
end
=end