class AddPositionToRoundMoves < ActiveRecord::Migration
  def change
    add_column :round_moves, :position, :integer
  end
end
