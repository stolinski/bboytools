class AddRoundIdAndRoundPositionToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :round_id, :integer
    add_index :moves, :round_id
    add_column :moves, :round_position, :integer
  end
end
