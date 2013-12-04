class AddColumnToMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :mentorship_id, :integer
  end
end
