class Listing < ApplicationRecord
  belongs_to :profile
  has_many :bookings, dependent: :destroy

  mount_uploader :photo, PhotoUploader
end

