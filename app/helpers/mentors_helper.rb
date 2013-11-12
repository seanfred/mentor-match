module MentorsHelper
 	def mentor_ability (skill)
		case skill
			when 3
				"Very Able"
			when 2
				"Somewhat Able"
			when 1
				"Not Able"
			end
	end
end