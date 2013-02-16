class AddRowOrderToTypes < ActiveRecord::Migration
  def change
    add_column :types, :row_order, :integer
  end
end
