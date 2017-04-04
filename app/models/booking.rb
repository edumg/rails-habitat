class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :listing

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
end
