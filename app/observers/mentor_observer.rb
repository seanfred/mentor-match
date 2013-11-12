class MentorObserver < ActiveRecord::Observer
	def after_create(mentor)
		Notifier.notification(mentor,
			"Mentor Match Confirmation",
			"Thanks for filling out your survey. You will be paired soon. Watch out for that email soon.").deliver
	end
end