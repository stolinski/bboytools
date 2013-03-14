class AddDescriptionToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :description, :text
  end
end
