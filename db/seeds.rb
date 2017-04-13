# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Listing.destroy_all
# Booking.destroy_all

# if !Listing.last.nil?
#   next_listing = Listing.last.id + 1
# else
#   next_listing = 1
# end

# num_card_gens = 10
# profile_id = Profile.last.id


# (next_listing..(next_listing+num_card_gens)).each do |id|
#   rnd = (rand(2)==1)
#   d = Listing.new(profile_id: 1, name: "Room 1", location: "Amsterdam", type_place: "room",
# description: "room in the city center", amenities: "none", price: 900, rules: "none",
# num_rooms: 4, registration: true, photo_cache: "image/upload/v1491397235/o5p9wh3wlep353aw3fhg.jpg", photo: "image/upload/v1491397235/o5p9wh3wlep353aw3fhg.jpg")
#   d.save
# end


Answer.destroy_all
Question.destroy_all
Photo.destroy_all
# Booking.destroy_all
# Listing.destroy_all


# Profile.destroy_all
# User.destroy_all

# Order.destroy_all
# Personality.destroy_all
# Personalitystorage.destroy_all
# Questionnaire.destroy_all

images_url = ["https://res.cloudinary.com/dc2fg86gy/image/upload/party_nv0ts7",
"https://res.cloudinary.com/dc2fg86gy/image/upload/john-sting-112628_urpf9v",
"https://res.cloudinary.com/dc2fg86gy/image/upload/File1_txtgha",
"https://res.cloudinary.com/dc2fg86gy/image/upload/File3_azp3hb",
"https://res.cloudinary.com/dc2fg86gy/image/upload/File4_lmvfil",
"https://res.cloudinary.com/dc2fg86gy/image/upload/File2_uxpdvw"]

#images_url = ["party_nv0ts7", "john-sting-112628_urpf9v", "File1_txtgha", "File2_uxpdvw", "File4_lmvfil", "File3_azp3hb"]
images_url.each do |img|
  new_ans = Answer.new
  new_ans.photo = img
  new_ans.save
end


(1..3).each do |i|
  new_question = Question.new
  new_question.question = "SOME QUESTION HERE!!!"
  new_question.id_alt = i
  new_question.save
end

# Profile.all.each do |profile|
#   upd = profile
#   upd.description = "Super easy going, loves a good classic rock n roll while having some beers. Works in a tech company and enjoy watching some TED talks from time to time."
#   upd.save
# end

# Listing.all.each do |listing|
#   upd = listing
#   upd.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id."
#   upd.save
# end


# photos_url = ["http://res.cloudinary.com/dc2fg86gy/image/upload/inteiror8_dam0uq",
# "http://res.cloudinary.com/dc2fg86gy/image/upload/inteiror6_qsnbho",
# "http://res.cloudinary.com/dc2fg86gy/image/upload/inteiror3_uwylg4",
# "http://res.cloudinary.com/dc2fg86gy/image/upload/inteiror9_bibeub",
# "http://res.cloudinary.com/dc2fg86gy/image/upload/inteiror5_fjsf3q",
# "http://res.cloudinary.com/dc2fg86gy/image/upload/inteiror1_iyef8n",
# "http://res.cloudinary.com/dc2fg86gy/image/upload/inteiror7_a0jswc",
# "http://res.cloudinary.com/dc2fg86gy/image/upload/inteiror4_fgl8nt"]



# Listing.all.each do |listing|
#   (1..3).each do |_|
#     new_photo = Photo.new
#     new_photo.photo = photos_url[rand(photos_url.length)]
#     new_photo.listing_id = listing.id
#     new_photo.save
#   end
# end





















