# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "building Users"
u = User.create(email: "antoine@gmail.com", password:"123456")
u_2 = User.create(email: "antoine.guilguet@gmail.com", password:"123456")
cities = ["Berlin", "Hamburg", "Munich", "Immenstaad", "Krakow"]
pictures = ["http://atomictoasters.com/wp-content/gallery/high-resolution-images/beautiful-tool.jpg","http://jewelrymakingjournal.com/wp-content/uploads/2012/03/virginia-vivier-jewelry-tools-4-375x319.jpg","https://atmedia.imgix.net/da725f53e8e7d4deddc218abb20201d54ba4fb51?auto=format&q=45&w=398.0&fit=max&cs=strip","https://images.manmadediy.com/Z3Zmo5U3KE5nx7kX9NpFPBgtvBk=/800x0/filters:no_upscale()/http://assets.manmadediy.com/photos/27757/IMG_4871_large_large.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqIuNZ-lXkzCItDRPcQoekD-VjePlAMsyp88gRrLtlni2JIfZQ", "http://otools1.wkfinetools.com/planes/x_usingP/ct-14/0_img/Photo2.jpg", "http://www.andersonplanes.com/gallery/images/oldstyle10a.jpg" ]


puts "building ten tools"
10.times do
  url = pictures.sample
  tool = Tool.new(
    name: Faker::Pokemon.name,
    description: Faker::Pokemon.move,
    price: Faker::Currency.name,
    category: Faker::Color.color_name,
    address:cities.sample,
    user_id: u.id
    )
  tool.remote_photo_url = url
  tool.save
  puts "building ten bookings"
  Booking.create(tool_id: tool.id, user_id: u.id)
  Booking.create(tool_id: tool.id, user_id: u_2.id)
end
