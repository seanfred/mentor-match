class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.integer :student_id
      t.string :description

      t.timestamps
    end
  end
end
