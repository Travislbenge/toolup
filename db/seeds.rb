# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Tool.destroy_all
User.destroy_all
Booking.destroy_all
puts "building Users"
u = User.create(email: "travis@gmail.com", password:"123456")
u_2 = User.create(email: "andrew@gmail.com", password:"123456")
cities = ["Denver", "Colorado Springs", "Boulder", "Fort Collins", "Breckenridge", "Grand Junction", "Durango"]
names = ["Tractor","Duck tape","Trench digger","Nailgun","Monkey wrench","Air compressor","Chainsaw","Hammer","Leaf blower","Makeshift Tractor"]
prices = [10,20,30,40,50,60,70,80,90,100]
categories = ["Machinery", "Power tool", "Machinery", "Power tool", "Hand tool", "Power tool", "Power tool", "Hand tool", "Power tool", "Machinery"]
descriptions = ["Really nice, capable tractor. My favorite", "Nothing is more dependable.", "If you need a trench, this is the tool for you.", "Hammer too slow? Try this nailgun!", "If your wrenches don't change size, you're probably doing something wrong.", "For people who need access to a higher density of air.", "For those who need to cut things, fast.", "Lost your hammer? You can rent mine!", "Autumn drowning you in leaves? Quick fix with this leaf blower!", "She may not look pretty but she gon get that job done!"]
tools = ["https://cdn.agriland.ie/uploads/2014/04/RBV_150_CropCutter_13_017-1024x683.jpg","http://images.mentalfloss.com/sites/default/files/styles/mf_image_16x9/public/w_17.png?itok=Tv8D5arf&resize=1100x619","http://photos.imageevent.com/jctair/rideontrenchingmachinesvermeer3550/websize/Veermer%20064.JPG","http://www.cashusabaltimore.com/content/images/thumbs/0000227_porter-cable-bn200c-nail-gun.jpeg","http://otools1.wkfinetools.com/mechanicT/z_readArticle/monkeyWrench/0_img/Pic%201.jpg","http://5.imimg.com/data5/XI/YK/MY-657316/air-compressor-250x250.jpg","https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Stihl_MS_170.JPG/1200px-Stihl_MS_170.JPG","https://cdn.shopify.com/s/files/1/0207/8508/products/MGNLPRDCT_48_of_71_1024x1024.jpg?v=1505925094","https://s.aolcdn.com/hss/storage/midas/8db1b200ae98a72a38be6acd1b485490/204545386/01-leaf-blower-2000.jpg","http://toolmonger.com/wp-content/uploads/2011/06/tractor-car.jpg"]
puts "building ten tools"

10.times do |x|
  url = tools[x]
  tool = Tool.new(
    name: names[x],
    description: descriptions[x],
    price: prices.sample,
    category: categories[x],
    address: cities.sample,
    user_id: u.id
    )
  tool.remote_photo_url = url
  tool.save
  puts "waiting..."
  Booking.create(tool_id: tool.id, user_id: u.id)
  Booking.create(tool_id: tool.id, user_id: u_2.id)
end

