class Type < ActiveRecord::Base
  attr_accessible :name, :row_order
  has_many :moves
end
