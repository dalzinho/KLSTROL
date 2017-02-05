require './models/Vendor'
require './models/Deal'
require './models/Burger'
require './db/sqlrunner'
require 'pry-byebug'

@vendor1 = Vendor.new({'name' => 'McDonalds'})
@vendor2 = Vendor.new({'name' => 'Five Guys'})
@vendor3 = Vendor.new({'name' => 'Gourmet Burger Kitchen'})
@vendor4 = Vendor.new({'name' => "Buddys"})
@vendor5 = Vendor.new({'name' => 'Burger King'})

@vendor1.save
@vendor2.save
@vendor3.save
@vendor4.save
@vendor5.save

@burger1 = Burger.new({'name' => 'le Big Mac', 'price' => 2.99, 'vendor_id' => 1 })
@burger2 = Burger.new({'name' => 'Royale with Cheese', 'price' => 3.99, 'vendor_id' => 1 })
@burger3 = Burger.new({'name' => 'Whopper', 'price' => 4.99, 'vendor_id' => 5 })

@burger1.save
@burger2.save
@burger3.save

@deal1 = Deal.new({'title' => 'Mental Monday', 'burger_id' => 1, 'day' => 'Monday'})
@deal2 = Deal.new({'title' => 'Cheeky Tuesday', 'burger_id' => 2, 'day' => 'Tuesday'})
@deal3 = Deal.new({'title' => 'Waistline Wednesday', 'burger_id' => 3, 'day' => 'Wednesday'})
@deal4 = Deal.new({'title' => 'Thank Thursday', 'burger_id' => 2, 'day' => 'Thursday'})
@deal5 = Deal.new({'title' => 'Big Fat Friday', 'burger_id' => 1, 'day' => 'Friday'})

@deal1.save
@deal2.save
@deal3.save
@deal4.save
@deal5.save

binding.pry
nil
