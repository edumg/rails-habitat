class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :listing

  monetize :price_cents

  validates :start_date, presence: true
  validates :end_date, presence: true

  #validates :num_guests, presence: true
  #validates :rent_cost, presence: true
  #validates :minimum_stay, presence:true
end
