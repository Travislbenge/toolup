class Tool < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :users, through: :bookings
  mount_uploader :photo, PhotoUploader
end
