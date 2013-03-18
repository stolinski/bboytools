class CreateRoundMoves < ActiveRecord::Migration
  def change
    create_table :round_moves do |t|
      t.integer :round_id
      t.integer :move_id

      t.timestamps
    end
    add_index :round_moves, :round_id
    add_index :round_moves, :move_id
  end
end
