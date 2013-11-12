class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :subject
      t.string :message
      t.string :receiver_type
      t.integer :receiver_id

      t.timestamps
    end
  end
end
