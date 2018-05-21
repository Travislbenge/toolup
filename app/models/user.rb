class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, uniqueness: true
  validates :user_address, presence: true
  has_many :bookings
  has_many :tools, through: :bookings
  has_many :my_tools, class_name: 'Tool'


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
