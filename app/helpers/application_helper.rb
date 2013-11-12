module ApplicationHelper

	def yes_format (yes)
		if yes == "y"
			"Yes"
		else
			"No"
		end
	end

	def empty_answer(attribute)
		attribute.presence ? attribute : "-"
	end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
