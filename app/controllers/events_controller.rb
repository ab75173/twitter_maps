class EventsController < ApplicationController

  def index
    events = Event.all
    nearby_events = []

<<<<<<< HEAD

=======
    @location_json = HTTParty.get('http://freegeoip.net/json/')
    user_lat = @location_json["latitude"]
    user_long = @location_json["longitude"]
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
>>>>>>> code allowing user to see only nearby events, by lat and long
  end

  def show

  end

end
