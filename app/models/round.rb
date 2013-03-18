class Round < ActiveRecord::Base
  attr_accessible :name, :move_id

  belongs_to :user
  has_many :round_moves, :order => "move_id ASC"
  has_many :moves, through: :round_moves, :order => "move_id ASC"
  accepts_nested_attributes_for :moves
end
