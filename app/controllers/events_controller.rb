class EventsController < ApplicationController

  def index

    # cookie maker:
    cookies.delete(:lat)
    cookies.delete(:long)
    cookies[:lat] = 34.052234
    cookies[:long] = -118.243685

    events = Event.all
    nearby_events = []

    # Getting user lat and long through IP address:
    # @location_json = HTTParty.get('http://freegeoip.net/json/')
    # user_lat = @location_json["latitude"]
    # user_long = @location_json["longitude"]

    # Getting user lat and long from the cookie created above! TEST!!!
    user_lat = cookies["lat"]
    user_long = cookies["long"]

    # Defining users local area (about 20 mile radius)
    user_lat_max = user_lat + 0.20
    user_lat_min = user_lat - 0.20
    user_long_max = user_long + 0.20
    user_long_min = user_long - 0.20

    events.each do |event|
      event_lat = event.latitude
      event_long = event.longitude

      if event_long < user_long_max && event_long > user_long_min && event_lat < user_lat_max && event_lat > user_lat_min
     nearby_events.push(event)
      end
    end

     @nearby_events = nearby_events
  end

  def show

  end

end
