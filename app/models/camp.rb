class Camp < ActiveRecord::Base
  attr_accessible :description, :student_id

  has_many :students
end
