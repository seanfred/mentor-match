class StudentObserver < ActiveRecord::Observer

	#sends an automated notification to the student/mentor letting them know to watch their inbox
	def after_create(student)
			Notifier.notification(student,
				"Mentor Match Confirmation",
				"Thanks for filling out your survey. You will be paired soon. Watch out for that email soon.").deliver
	end
end