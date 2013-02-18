class BattlesUser < ActiveRecord::Base

	attr_accessible :user_id, :battle_id, :battle, :user

	belongs_to :battle
	belongs_to :user

end
