class EventsController < ApplicationController

  def index

    # cookies.delete(:lat)
    # cookies.delete(:long)

    events = Event.all

    @nearby_events = []
    if user_signed_in?
      #user is signed in and they are taken from database
      user = current_user
      @user_lat = user.latitude
      @user_long = user.longitude
    else
      #user is not signed in and is searching for zip
      if params[:q]
        zip_param_to_coord
      else
        @user_lat = cookies["lat"]
        @user_long = cookies["long"]
      end

    end

    user_lat_max = @user_lat.to_f + 0.20
    user_lat_min = @user_lat.to_f - 0.20
    user_long_max = @user_long.to_f + 0.20
    user_long_min = @user_long.to_f - 0.20

    events.each do |event|
      event_lat = event.latitude
      event_long = event.longitude

      if event_long < user_long_max && event_long > user_long_min && event_lat < user_lat_max && event_lat > user_lat_min
        @nearby_events.push(event)
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def zip_param_to_coord
    zip_code = params[:q]
    cookies[:zip] = zip_code
    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + cookies[:zip])
    latitude = response["results"][0]["geometry"]["location"]["lat"].to_f
    longitude = response["results"][0]["geometry"]["location"]["lng"].to_f

    # cookie maker:

    cookies[:lat] = latitude
    cookies[:long] = longitude
    @user_lat = cookies["lat"]
    @user_long = cookies["long"]
  end

end
