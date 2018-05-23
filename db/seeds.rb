# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "building ten tools"
10.times do
  tool = Tool.new(
    name: Faker::Pokemon.name,
    description: Faker::Pokemon.move,
    price: Faker::Currency.name,
    category: Faker::Color.color_name

    )
  tool.save

end
puts "fishing"




puts "building ten bookings"
5.times do
  booking = Booking.new(
    tool_id: rand(1..3),
    user_id: rand(1..3)

    )
  booking.save
end
puts "hunting"
