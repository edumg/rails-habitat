# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if !Listing.nil?
  next_listing = Listing.last.id + 1
else
  next_listing = 1
end

num_card_gens = 10
profile_id = Profile.last.id


(next_listing...(next_listing+num_card_gens)).each do |id|

  d = Listing.new(profile_id: 1, name: "Room 12", location: "Amsterdam", type_place: "room",
description: "room in the city center", amenities: "none", price: 900.0, rules: "none",
num_rooms: 4,
registration: true, created_at: "2017-04-05 13:00:32", updated_at: "2017-04-05 13:24:45",
photo: "image/upload/v1491397235/o5p9wh3wlep353aw3fhg.jpg">
