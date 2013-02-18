class AddIterationToBattles < ActiveRecord::Migration
  def change
    add_column :battles, :iteration, :integer
  end
end
