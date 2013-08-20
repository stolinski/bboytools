class AddLevelToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :level, :integer
  end
end
