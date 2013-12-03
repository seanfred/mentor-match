class AddColumnToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :mentor_id, :integer
  end
end
