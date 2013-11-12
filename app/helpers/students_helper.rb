module StudentsHelper
 	def skill_format (skill)
		case skill
			when 3
				"Expert"
			when 2
				"Competent"
			when 1
				"Beginner"
			end
	end
end
