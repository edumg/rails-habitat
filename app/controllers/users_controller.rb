class UsersController < Devise::RegistrationsController
  def create
    super do
      new_profile = Profile.new(user_id: resource.id)
      new_profile.photo = "user_gqomus"
      new_profile.save
    end
  end

  # protected

  # def after_sign_up_path_for(resource)
  #   edit_profile_path
  # end


end

