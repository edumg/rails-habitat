class BookingsController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def delete
  end

  def index
    @bookings = Booking.all
  end

  private

  def booking_params
    params.require(:booking).permit(:listing_id, :profile_id, :status, :start_date, :end_date, :num_guests, :rent_cost, :minimum_stay)
  end
end
