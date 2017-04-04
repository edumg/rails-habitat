class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :profile

  validates :email, presence:true, uniqueness:true
  validates :password, presence:true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  acts_as_messageable

  def mailboxer_name
    if !current_user.nil?
      name = "#{current_user.fist_name}_#{current_user.last_name}"
      return name
    else
      self.email
    end
  end

  def mailboxer_email(object)
    self.email
  end

  def name
    email
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.

    if user
      user.update(user_params)
      #profile = user.profile
     #profile.first_name = auth.info.first_name
      #profile.last_name = auth.info.last_name
      #profile.photo = auth.info.image
      #profile.save
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save

      profile_params = auth.info.slice(:first_name, :last_name, :gender, :birth_date)
      profile_params[:user_id] = user.id

      profile = Profile.new(profile_params)
      profile.save
    end
    return user
  end
end
