# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Listing.destroy_all
Booking.destroy_all

if !Listing.last.nil?
  next_listing = Listing.last.id + 1
else
  next_listing = 1
end

num_card_gens = 10
profile_id = Profile.last.id


(next_listing..(next_listing+num_card_gens)).each do |id|
  rnd = (rand(2)==1)
  d = Listing.new(profile_id: 1, name: "Room 1", location: "Amsterdam", type_place: "room",
description: "room in the city center", amenities: "none", price: 900, rules: "none",
num_rooms: 4, registration: true, photo_cache: "image/upload/v1491397235/o5p9wh3wlep353aw3fhg.jpg", photo: "image/upload/v1491397235/o5p9wh3wlep353aw3fhg.jpg")
  d.save
end
