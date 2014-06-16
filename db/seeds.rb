# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create([
  {title: "Ted Talk on the Mall",
  latitude: 38.8901,
  longitude: -77.0236},

  {title: "Los Angeles Party",
  latitude: 34.0522,
  longitude: -118.2436}
  ])
