class EventsController < ApplicationController

  def index
    events = Event.all

    if user_signed_in?
      #user is signed in and their location is taken from database
      user = current_user
      @user_lat = user.latitude
      @user_long = user.longitude
    else
      if params[:q] #user is not signed in and is searching for zip in nav field
        zip_param_to_coord(params[:q])
      else #user is not signed in and has already searched for zip; now stored in cookies
        @user_lat = cookies["lat"]
        @user_long = cookies["long"]
      end

    end

    #defines perimeter that qualifies as nearby events
    user_lat_max = @user_lat.to_f + 0.20
    user_lat_min = @user_lat.to_f - 0.20
    user_long_max = @user_long.to_f + 0.20
    user_long_min = @user_long.to_f - 0.20

    @nearby_events = []
    events.each do |event|
      #for each event, find out if it is in perimeter of user location
      if event.longitude < user_long_max && event.longitude > user_long_min && event.latitude < user_lat_max && event.latitude > user_lat_min
        # if it is in perimeter, add it to nearby events array
        @nearby_events.push(event)
      end
    end
  end

  def show
    # GETS THE EVENT BY ITS ID IN PARAMS:
    @event = Event.find(params[:id])
    # FINDS AN EXISTING FAVORITE IF IT HAS CURRENT USER ID AND CURRENT EVENT ID
    if user_signed_in?
      @favorite = Favorite.find_by(event_id: @event.id, user_id: current_user.id)
    end

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
    @count = @client.search(@event.hashtag, :result_type => "recent").count
  end

  def search
    events = Event.all

    if params[:zipCode] #user is not signed in and is searching for zip in nav field
      zip_param_to_coord(params[:zipCode])
    else #user is not signed in and has already searched for zip; now stored in cookies
      @user_lat = cookies["lat"]
      @user_long = cookies["long"]
    end

    user_lat_max = @user_lat.to_f + 0.20
    user_lat_min = @user_lat.to_f - 0.20
    user_long_max = @user_long.to_f + 0.20
    user_long_min = @user_long.to_f - 0.20

    @nearby_events = []
    events.each do |event|
      #for each event, find out if it is in perimeter of user location
      if event.longitude < user_long_max && event.longitude > user_long_min && event.latitude < user_lat_max && event.latitude > user_lat_min
        # if it is in perimeter, add it to nearby events array
        @nearby_events.push(event)
      end
    end
    render json: { listOfEvents: @nearby_events }
  end


  private

  def zip_param_to_coord(zip)
    #grabs zip code from form and runs it through googleAPI geocoder to get lat & long
    cookies[:zip] = zip
    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + cookies[:zip])
    latitude = response["results"][0]["geometry"]["location"]["lat"].to_f
    longitude = response["results"][0]["geometry"]["location"]["lng"].to_f

    #cookie maker to store lat & long in session:
    cookies[:lat] = latitude
    cookies[:long] = longitude
    @user_lat = cookies["lat"]
    @user_long = cookies["long"]
  end

end
