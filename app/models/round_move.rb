class RoundMove < ActiveRecord::Base
  attr_accessible :move_id, :round_id

  belongs_to :round
  belongs_to :move
end
