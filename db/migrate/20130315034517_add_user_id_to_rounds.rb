class AddUserIdToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :user_id, :integer
    add_index :rounds, :user_id
  end
end
