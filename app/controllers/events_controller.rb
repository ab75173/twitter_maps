class EventsController < ApplicationController

  def index

    # cookie maker:
    cookies.delete(:lat)
    cookies.delete(:long)
    cookies[:lat] = 34.052234
    cookies[:long] = -118.243685

    events = Event.all

    @nearby_events = []
    if user_signed_in?
      @user = current_user
      user_lat = @user.latitude
      user_long = @user.longitude
    else

      user_lat = cookies["lat"]
      user_long = cookies["long"]
    end

    user_lat_max = user_lat + 0.20
    user_lat_min = user_lat - 0.20
    user_long_max = user_long + 0.20
    user_long_min = user_long - 0.20

    events.each do |event|
      event_lat = event.latitude
      event_long = event.longitude

      if event_long < user_long_max && event_long > user_long_min && event_lat < user_lat_max && event_lat > user_lat_min
        @nearby_events.push(event)
      end
    end
  end

  def show

  end

end
