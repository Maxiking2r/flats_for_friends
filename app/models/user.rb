class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  has_many :flats, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  # # def self.from_omniauth(auth)
  # #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  # #     user.email = auth.info.email
  # #     user.password = Devise.friendly_token[0, 20]
  # #     user.name = auth.info.name   # assuming the user model has a name
  # #     user.image = auth.info.image # assuming the user model has an image
  # #     # If you are using confirmable and the provider(s) you use validate emails,
  # #     # uncomment the line below to skip the confirmation emails.
  # #     # user.skip_confirmation!
  # #   end
  # # end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end


end
