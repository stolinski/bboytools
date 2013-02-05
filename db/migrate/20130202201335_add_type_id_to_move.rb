class AddTypeIdToMove < ActiveRecord::Migration
  def change
    add_column :moves, :type_id, :integer
    add_index :moves, :type_id
  end
end
