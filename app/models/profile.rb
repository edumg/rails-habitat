class Profile < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :listings

  mount_uploader :photo, PhotoUploader
end
