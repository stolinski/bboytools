class AddIndexToBattleUsers < ActiveRecord::Migration
  def change
  	add_index :battles_users, :user_id
  	add_index :battles_users, :battle_id
  end
end
