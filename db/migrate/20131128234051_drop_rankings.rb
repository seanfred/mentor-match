class DropRankings < ActiveRecord::Migration
  def up
    drop_table :rankings
  end

  def down
    create_tab :rankings do |t|

    end
  end
end
