class ProfilesController < ApplicationController
  before_action :get_current_profile, only: [:show, :update, :edit]
  after_filter "save_my_previous_url", only: [:show]
  before_action :get_profile_bookings_host, only: [:show]

  def show
    @back_url = session[:my_previous_url]
    @listings = current_user.profile.listings
    @person_results = Personalitystorage.where session: session.id
  end

  def update
    @profile.update(profile_params)
    flash[:notice] = "Profile udpated sucessfully!"
    redirect_to root_path
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :description, :gender, :is_host, :birth_date, :user_description, :photo, :photo_cache)
  end

  def save_my_previous_url
    session[:my_previous_url] = URI(request.referer || '').path
  end

  def get_current_profile
    @profile = current_user.profile
  end

  def get_profile_bookings_host
    @bookings = current_user.profile.bookings
  end

end
