class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :delete]
  before_action :set_current_user
  before_action :set_listing_by_id, only: [:new, :create, :index]

  def index
    @bookings = Booking.all
    @list_book_path = false
    if params[:listing_id]
      @list_book_path = true
      # get bookings of a listing
      @listing_bookings = Booking.where(listing_id: params[:listing_id]).order(start_date: :desc)
      @foo_attr = { "data-foo-1" => 1, "data-foo-2" => 2 }
    end

    if current_user.profile.is_host
      @bookings = current_user.profile.bookings
    end
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

    @booking.price_cents = @listing.price
    @booking.rent_cost_cents = @listing.price
    @booking.status = "CREATED"


    start_date = params[:booking][:start_date]
    end_date = params[:booking][:end_date]

    if @booking.save && ( end_date >= start_date )
      #notify host
      recipients = User.where(id: @listing.profile.user.id)
      msg_body = "New booking was created for listing #{@listing.name} with booking id #{@booking.id}!"
      msg_subject = "New booking for listing #{@listing.name}"
      conversation = current_user.send_message(recipients, msg_body, msg_subject).conversation
      flash[:notice] = "Notification email was sent to the host!"

      redirect_to booking_path(@booking)
    else
      render :new
    end

  end

  def show
    @profile = current_user.profile
   #@booking = Booking.find_by profile_id: @profile.id
    @booking.status = "PAYMENT"
    @total_price = @booking.rent_cost_cents
    sleep 9
  end

  def delete
    @booking.destroy
    redirect_to user, notice: 'Booking was successfully cancelled.'
  end

  def destroy
    @booking.destroy
    redirect_to @listing
  end

  def mark_as_available_to_pay
    raise params.inspect
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
    if params[:listing_id]
      @listing = Listing.find(params[:listing_id])
    end
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
