class UserBattle < ActiveRecord::Base
	attr_accessible :battle_id, :notes, :user_id

	belongs_to :user
	belongs_to :battle
end
