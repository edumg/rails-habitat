class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  before_action :set_current_profile_user, only: [:create, :show, :edit, :update, :destroy]
  before_action :warning_person_test, only: [:show]
  after_filter "save_my_previous_url", only: [:show]

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.profile_id = @user.id
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def verify
    raise params.inspect
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  def show
    @listing = Listing.find(params[:id])
    @back_url = session[:my_previous_url]
    @alert_message = "You are viewing #{@listing.name}"
    @listing_coordinates = { lat: @listing.latitude, lng: @listing.longitude }

    # @photos = Photo.where listing_id: @listing.id
    @photos = get_photos()
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
    #@listings = Listing.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
    end
  end

  private

  def get_photos
    photos = []
    (1..3).each do |_|
      photos << Photo.all.sample
    end

    return photos
  end

  def warning_person_test
    listing = Listing.find(params[:id])
    @questionnaire = Questionnaire.find_by listing_id: listing
    if @questionnaire.nil? and @user.id == listing.profile.id
      flash['alert'] = "Personality test is missing!"
    end
  end

  def listing_params
    params.require(:listing).permit(:type_place, :name, :location, :latitude, :longitude, :description, :photo, :photo_cache, :amenities, :rules, :profile_id, :price, :num_rooms)
  end

  def set_current_profile_user
    @user = current_user.profile
  end

  def save_my_previous_url
    # session[:previous_url] is a Rails built-in variable to save last url.
    session[:my_previous_url] = URI(request.referer || '').path
  end

end
