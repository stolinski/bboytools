class Move < ActiveRecord::Base
  attr_accessible :name, :user_id, :video, :type_id
  belongs_to :user
  belongs_to :type
end
