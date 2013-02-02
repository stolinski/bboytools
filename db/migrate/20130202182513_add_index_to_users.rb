class AddIndexToUsers < ActiveRecord::Migration
  def change
  	add_index :users, :bboy_name, unique: true
  end
end
