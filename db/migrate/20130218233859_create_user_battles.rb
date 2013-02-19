class CreateUserBattles < ActiveRecord::Migration
  def change
    create_table :user_battles do |t|
      t.integer :user_id
      t.integer :battle_id
      t.string :notes

      t.timestamps
    end
    add_index :user_battles, :user_id
    add_index :user_battles, :battle_id
  end
end
