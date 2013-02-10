class AddBmodeToMoves < ActiveRecord::Migration
  def change
  	add_column :moves, :bmode, :boolean
  end
end
