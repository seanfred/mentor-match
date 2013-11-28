class DropNotifications < ActiveRecord::Migration
  def up
    drop_table :notifications
  end

  def down
    create_table :notifications do |t|

    end
  end
end
