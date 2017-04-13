class Booking < ApplicationRecord
  belongs_to :profile
  belongs_to :listing

  monetize :price_cents

  validates :start_date, presence: true
  validates :end_date, presence: true

  #validates :num_guests, presence: true
  #validates :rent_cost, presence: true
  #validates :minimum_stay, presence:true

  def start_date
    return super if super.present?
    Date.today
  end

  def end_date
    return super if super.present?
    Date.today + 6.months
  end
end
