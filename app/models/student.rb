class Student < ActiveRecord::Base
  attr_accessible :user_id, :camp_id, :name, :profile


  belongs_to :user, dependent: :delete
  belongs_to :camp
  has_many :mentorships
  has_many :mentors, through: :mentorships

end
