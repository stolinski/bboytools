class RoundMove < ActiveRecord::Base
  default_scope order('position')
  attr_accessible :move_id, :round_id

  belongs_to :round
  belongs_to :move

  acts_as_list scope: :round
end
