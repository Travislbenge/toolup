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


book1 = Booking.new(tool_id: 1, user_id: 1)
book1.save

book2 = Booking.new(tool_id: 2, user_id: 2)
book2.save

book3 = Booking.new(tool_id: 3, user_id: 3)
book3.save
