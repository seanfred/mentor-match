class AddUseridtoMentorsandStudentsTable < ActiveRecord::Migration
  def up
    add_column :mentors, :user_id, :integer
    add_column :students, :user_id, :integer
  end

  def down
  end
end
