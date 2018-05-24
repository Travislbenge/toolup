# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Tool.destroy_all
Booking.destroy_all
User.destroy_all

puts "building Users"
u = User.create(email: "antoine@gmail.com", password:"123456")
u_2 = User.create(email: "antoine.guilguet@gmail.com", password:"123456")

puts "building ten tools"
10.times do
  url = 'http://cdn1.bigcommerce.com/server5600/muyrz/product_images/uploaded_images/tools-cropped.jpg?t=1504028176'
  tool = Tool.new(
    name: Faker::Pokemon.name,
    description: Faker::Pokemon.move,
    price: Faker::Currency.name,
    category: Faker::Color.color_name,
    address: Faker::Address.street_name,
    user_id: u.id,
    photo: url
    )
  tool.remote_photo_url = url
  tool.save
  puts "building ten bookings"
  Booking.create(tool_id: tool.id, user_id: u.id)
  Booking.create(tool_id: tool.id, user_id: u_2.id)
end
