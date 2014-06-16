class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :zip_to_coord
  def zip_to_coord
    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + zip_code)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"].to_f
    self.longitude = response["results"][0]["geometry"]["location"]["lng"].to_f

  end
end
