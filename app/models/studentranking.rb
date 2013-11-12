class Studentranking < ActiveRecord::Base
  attr_accessible :mentor_id, :rank, :student_id

  belongs_to :mentor
  belongs_to :student
end
