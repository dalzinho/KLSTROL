require './models/Vendor'
require './models/Deal'
require './models/Burger'
require './models/LinkDealsBurgers'
require './db/sqlrunner'
require 'pry-byebug'

@vendor1 = Vendor.new({'name' => 'McDonalds'})
# @vendor2 = Vendor.new({'name' => 'Five Guys'})
# @vendor3 = Vendor.new({'name' => 'Gourmet Burger Kitchen'})
# @vendor4 = Vendor.new({'name' => "Buddys"})
# @vendor5 = Vendor.new({'name' => 'Burger King'})

@vendor1.save
# @vendor2.save
# @vendor3.save
# @vendor4.save
# @vendor5.save

@burger1 = Burger.new({'name' => 'le Big Mac', 'price' => 2.99, 'calories' => 2, 'vendor_id' => 1})
@burger2 = Burger.new({'name' => 'Royale with Cheese', 'price' => 3.99, 'calories' => 3, 'vendor_id' => 1 })
# @burger3 = Burger.new({'name' => 'Whopper', 'price' => 4.99, 'vendor_id' => 5 })

@burger1.save
@burger2.save
# @burger3.save

@deal1 = Deal.new({'title' => 'Cheeky Tuesday', 'vendor_id' => 1, 'day' => 'Tuesday', 'description' => "buy one get one free!", 'burgers_included' => 2, 'price_adjustment' => 1})
# @deal2 = Deal.new({'title' => 'Cheeky Tuesday', 'vendor_id' => 2, 'day' => 'Tuesday'})
# @deal3 = Deal.new({'title' => 'Waistline Wednesday', 'vendor_id' => 3, 'day' => 'Wednesday'})
# @deal4 = Deal.new({'title' => 'Thank Thursday', 'vendor_id' => 4, 'day' => 'Thursday'})
# @deal5 = Deal.new({'title' => 'Big Fat Friday', 'vendor_id' => 5, 'day' => 'Friday'})

@deal1.save
# @deal2.save
# @deal3.save
# @deal4.save
# @deal5.save

@link1 = LinkDealsBurgers.new({'deal_id' => 1, 'burger_id' => 1})
@link2 = LinkDealsBurgers.new({'deal_id' => 1, 'burger_id' => 2})

@link1.save
@link2.save

binding.pry
nil
