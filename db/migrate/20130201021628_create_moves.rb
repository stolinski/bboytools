class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name
      t.string :video
      t.integer :user_id

      t.timestamps
    end
    add_index :moves, :user_id
  end
end
