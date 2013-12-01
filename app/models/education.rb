class Education < ActiveRecord::Base
  belongs_to :full_profile
  attr_accessible :activities, :degree, :end_date, :field_of_study, :full_profile_id, :notes, :school_name, :start_date
end
