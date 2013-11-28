class DropStudentrankings < ActiveRecord::Migration
  def up
    drop_table :studentrankings
  end

  def down
    create_table :studentrankings do |t|

    end
  end
end
