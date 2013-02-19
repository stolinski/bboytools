class Battle < ActiveRecord::Base
	attr_accessible :date, :location, :name, :iteration, :battle_id, :notes, :user_id, :user_battles_attributes, :user_battles

	has_many :user_battles
	has_many :users, through: :user_battles

	accepts_nested_attributes_for :user_battles
end

