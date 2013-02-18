class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.string :name
      t.string :location
      t.date :date
      t.text :results
      t.text :notes

      t.timestamps
    end
  end
end
