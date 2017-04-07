class Profile < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :listings
  belongs_to :personality

  mount_uploader :photo, PhotoUploader
end
