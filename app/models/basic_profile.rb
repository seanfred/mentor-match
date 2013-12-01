class BasicProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :first_name, :formatted_name, :headline, :industry, :last_name, :location, :maiden_name, :picture_url, :public_profile_url, :specialties, :summary, :user_id
end
