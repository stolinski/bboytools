class Move < ActiveRecord::Base
  attr_accessible :name, :user_id, :video, :type_id, :bmode


  belongs_to :user
  belongs_to :type

  default_scope order("created_at DESC")

  scope :toprock, where( type_id: 6)
  scope :footwork, where( type_id: 3)
  scope :power, where( type_id: [1,2])
  scope :freezes, where( type_id: [4,5])
end
