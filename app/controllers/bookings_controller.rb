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
end
