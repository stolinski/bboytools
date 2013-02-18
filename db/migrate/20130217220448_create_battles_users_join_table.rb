class CreateBattlesUsersJoinTable < ActiveRecord::Migration
	def change
		create_table :battles_users, :id => false do |t|
			t.integer :battle_id
			t.integer :user_id
			t.text :notes
			t.text :results
		end
	end
end
