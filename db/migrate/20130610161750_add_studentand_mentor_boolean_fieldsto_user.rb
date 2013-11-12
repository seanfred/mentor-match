class AddStudentandMentorBooleanFieldstoUser < ActiveRecord::Migration
  def up
    add_column :users, :approval, :integer, :default => 0
    add_column :users, :role, :string
  end

  def down
  end
end
