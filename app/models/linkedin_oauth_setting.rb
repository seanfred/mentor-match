class LinkedinOauthSetting < ActiveRecord::Base
  belongs_to :user
  attr_accessible :asecret, :atoken, :user_id
end
