# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create([
  {hashtag: "#TEDDC",
  title: "sharing ideas in our nation's capital",
  description: "a conversation about Politics, Law, and marble buildings, you won't need to bring a shopping bag",
  latitude: 38.88962,
  longitude: -77.022977,
  datetime: "2014-09-12 13:00",
  hashtag_id: "478919592786395136",
  address: "1145 17th Street, NW",
  city: "Washington",
  state: "DC",
  zip_code: "20036",
  tweet_goal: 10,
  event_clue_one: "slightly centre-left, geographically speaking...",
  event_clue_two: "three in a row, tic, tac, toe!"
  },

  {hashtag: "#WDIGRADU",
  title: "WDI Class Graduation",
  description: "General Assembly WDI class graduation day!",
  latitude: 38.904853,
  longitude: -77.034003,
  datetime: "2014-08-16 17:30",
  hashtag_id: "479254328838868992",
  address: "1355 15th Street NW",
  city: "Washington",
  state: "DC",
  zip_code: "20005",
  tweet_goal: 10
  },

  {hashtag: "#AWESOMELA",
  title: "Los Angeles Party",
  description: "A huge, secret party. If you want to come, youre not invited.",
  latitude: 34.081193,
  longitude: -118.385282,
  datetime: "2014-11-7 23:59",
  hashtag_id: "478905944500215808",
  address: "606 N Robertson Blvd",
  city: "West Hollywood",
  state: "CA",
  zip_code: "90069"
  },

  ])


