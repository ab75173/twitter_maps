class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :favorites, dependent: :destroy
  has_many :events, through: :favorites
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:twitter]

  before_save :zip_to_coord
  def zip_to_coord
    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + zip_code)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"].to_f
    self.longitude = response["results"][0]["geometry"]["location"]["lng"].to_f

  end

  def self.find_for_twitter_oauth(auth, current_user)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    # else
    #   registered_user = User.where(:email => auth.uid + "@twitter.com").first
    #   if registered_user
    #     return registered_user
    else
      current_user.update(provider: auth.provider, uid: auth.uid)
      user = User.where(:provider => auth.provider, :uid => auth.uid).first
      return user
    end
  end

end

