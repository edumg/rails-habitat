class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :delete]
  before_action :set_current_user
  before_action :set_listing_by_id, only: [:new, :create]

  def index
    @bookings = current_user.profile.bookings
  end

  def edit
    @profile = current_user.profile
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @listing.bookings.new(reservation_params)
    @booking.profile_id = current_user.profile.id
    @booking.listing_id = params[:listing_id]

    start_date = Date.civil(params[:booking]["start_date(1i)"].to_i,params[:booking]["start_date(2i)"].to_i,params[:booking]["start_date(3i)"].to_i)
    end_date = Date.civil(params[:booking]["end_date(1i)"].to_i,params[:booking]["end_date(2i)"].to_i,params[:booking]["end_date(3i)"].to_i)

    if @booking.save && ( end_date >= start_date )
      redirect_to booking_path(@booking)
    else
      render :new
    end

  end

  def show
    @profile = current_user.profile
    @booking = Booking.find_by profile_id: @profile.id
  end

  def delete
    @booking.destroy
    redirect_to user, notice: 'Booking was successfully cancelled.'
  end

  def destroy
    @booking.destroy
    redirect_to @listing
  end

  private

  def get_listing_by_id
    @listing = Listing.find(params[:listing_id])
  end

  def set_current_user
    @user = current_user
  end

  def set_reservation
    @booking = Booking.find(params[:id])
  end

  def reservation_params
    params.require(:booking).permit(:minimum_stay, :status, :num_guests, :rent_cost, :profile, :listing, :start_date, :end_date)
  end

  def set_listing_by_id
    @listing = Listing.find(params[:listing_id])
  end

  def range_params
    start_year = reservation_params["start_date(1i)"].to_i
    start_month = reservation_params["start_date(2i)"].to_i
    start_day = reservation_params["start_date(3i)"].to_i
    end_year = reservation_params["end_date(1i)"].to_i
    end_month = reservation_params["end_date(2i)"].to_i
    end_day = reservation_params["end_date(3i)"].to_i
    st_date = Date.new(start_year,start_month,start_day).to_i
    en_date = Date.new(end_year,end_month,end_day).to_i

    range_date = [st_date..en_date]
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:listing_id, :profile_id, :status, :start_date, :end_date, :num_guests, :rent_cost, :minimum_stay)
  end


  def range_params
  start_year = reservation_params["start_date(1i)"].to_i
  start_month = reservation_params["start_date(2i)"].to_i
  start_day = reservation_params["start_date(3i)"].to_i
  end_year = reservation_params["end_date(1i)"].to_i
  end_month = reservation_params["end_date(2i)"].to_i
  end_day = reservation_params["end_date(3i)"].to_i
  st_date = Date.new(start_year,start_month,start_day).to_i
  en_date = Date.new(end_year,end_month,end_day).to_i

  end
end
