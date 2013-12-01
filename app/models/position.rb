class Position < ActiveRecord::Base
  belongs_to :full_profile
  attr_accessible :company, :end_date, :full_profile_id, :is_current, :start_date, :summary, :title
end
