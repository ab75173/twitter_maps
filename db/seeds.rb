# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create([
  {hashtag: "#TEDDC",
  title: "Ted Talk on the Mall",
  description: " A TED talk all about Politics, Law, and marble buildings",
  latitude: 38.8901,
  longitude: -77.0236,
  datetime: "2014-09-12 13:00",
  hashtag_id: "478919592786395136"
  },

  {hashtag: "#WDIGRADU",
  title: "WDI class graduation",
  description: "General Assembly WDI class graduation day!",
  latitude: 38.9047,
  longitude: -77.0342,
  datetime: "2014-08-16 17:30",
  hashtag_id: ""
  },

  {hashtag: "#AWESOMELA",
  title: "Los Angeles Party",
  description: "A huge, secret party. If you want to come, youre not invited.",
  latitude: 34.0522,
  longitude: -118.2436,
  datetime: "2014-11-7 23:59",
  hashtag_id: "478905944500215808"}
  ])
