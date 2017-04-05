class ListingsController < ApplicationController

  before_action :set_current_user, only: [:show, :edit, :update, :destroy]
  after_filter "save_my_previous_url", only: [:show]

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.profile_id = current_user.id
    if @listing.save
      redirect_to listings_path
    else
      render :new
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  def show
    @listing = Listing.find(params[:id])
    @back_url = session[:my_previous_url]
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def index
    @listings = Listing.all
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :location, :latitude, :longitude, :description, :photo, :photo_cache, :amenities, :rules, :profile_id, :price, :num_rooms, :registration)
  end

  def set_current_user
    @user = current_user
  end

  def save_my_previous_url
    # session[:previous_url] is a Rails built-in variable to save last url.
    session[:my_previous_url] = URI(request.referer || '').path
  end

end
