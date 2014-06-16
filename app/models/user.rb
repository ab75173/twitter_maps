class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:twitter]

  before_save :zip_to_coord
  def zip_to_coord
    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + zip_code)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"].to_f
    self.longitude = response["results"][0]["geometry"]["location"]["lng"].to_f

  end

  def self.find_for_twitter_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
