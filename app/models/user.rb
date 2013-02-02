class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :bboy_name, :crew_name
  # attr_accessible :title, :body
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bboy_name, presence: true
  validates :email, presence: true,  uniqueness: true

  has_many :moves
end
