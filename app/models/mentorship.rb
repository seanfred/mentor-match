class Mentorship < ActiveRecord::Base
  attr_accessible :mentor_id, :student_id

  belongs_to :student
  belongs_to :mentor

end
