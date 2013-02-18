class Battle < ActiveRecord::Base
  attr_accessible :date, :location, :name, :user_id, :iteration

  has_many :battles_users
  has_many :users, through: :battles_users

end
