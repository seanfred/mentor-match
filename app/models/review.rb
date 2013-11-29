class Review < ActiveRecord::Base
  attr_accessible :body, :student

  belongs_to :mentor

end
