class ProfilesController < ApplicationController
  before_action :get_current_profile, only: [:show, :update, :edit]
  after_filter "save_my_previous_url", only: [:show]

  def show
    @back_url = session[:my_previous_url]
  end

  def update
    @profile.update(profile_params)
    redirect_to root_path
  end

  def edit
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :gender, :is_host, :birth_date, :user_description, :photo, :photo_cache)
  end

  def save_my_previous_url
    session[:my_previous_url] = URI(request.referer || '').path
  end

  def get_current_profile
    @profile = current_user.profile
  end

end
