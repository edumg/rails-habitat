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

images_url = ["http://res.cloudinary.com/dc2fg86gy/image/upload/party_nv0ts7",
"http://res.cloudinary.com/dc2fg86gy/image/upload/john-sting-112628_urpf9v",
"http://res.cloudinary.com/dc2fg86gy/image/upload/File1_txtgha",
"http://res.cloudinary.com/dc2fg86gy/image/upload/File3_azp3hb",
"http://res.cloudinary.com/dc2fg86gy/image/upload/File4_lmvfil",
"http://res.cloudinary.com/dc2fg86gy/image/upload/File2_uxpdvw"]

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
