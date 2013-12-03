class Review < ActiveRecord::Base
  attr_accessible :body, :student, :mentor_id

  belongs_to :mentor

end
