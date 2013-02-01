class Move < ActiveRecord::Base
  attr_accessible :name, :user_id, :video
  belongs_to :user
end
