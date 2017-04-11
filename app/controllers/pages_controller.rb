class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @listings = Listing.all
    if user_signed_in?

      if current_user.profile.first_name.nil?  || current_user.profile.last_name.nil?  || current_user.profile.birth_date.nil?  || current_user.profile.gender.nil?
        redirect_to profile_path
      end
    end
  end
end
