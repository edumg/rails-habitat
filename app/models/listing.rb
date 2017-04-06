class Listing < ApplicationRecord
  belongs_to :profile
  has_many :bookings, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  validates :description, presence:true
  validates :name, presence:true
  validates :type_place, presence:true
  validates :amenities, presence:true
  validates :rules, presence:true
  validates :location, presence:true
  validates :price, presence:true
  validates :num_rooms, presence:true
  validates :registration, presence:true

  mount_uploader :photo, PhotoUploader
end
