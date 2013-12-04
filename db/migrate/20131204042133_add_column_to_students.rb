class AddColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :mentorship_id, :integer
  end
end
