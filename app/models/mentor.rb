class Mentor < ActiveRecord::Base
  attr_accessible :user_id, :name, :profile, :active, :capacity


  has_many :students, through: :mentorships
  belongs_to :user, dependent: :delete
  has_many :reviews
  has_many :mentorships


end
