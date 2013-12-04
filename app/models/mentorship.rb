class Mentorship < ActiveRecord::Base
  attr_accessible :mentor_id, :student_id

  has_many :students
  has_many :mentors

end
