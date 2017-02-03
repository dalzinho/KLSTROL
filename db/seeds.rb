require './models/Vendor'
require './models/Deal'
require './models/Burger'
require './db/sqlrunner'
require 'pry-byebug'

@vendor1 = Vendor.new({'name' => 'McDonalds'})
@vendor1.save

@burger1 = Burger.new({'name' => 'le Big Mac', 'price' => 2.99, 'vendor_id' => 1 })
@burger1.save

@deal1 = Deal.new({'title' => 'Big Fat Friday', 'burger_id' => 1, 'day' => 'Wednesday'})
@deal1.save


binding.pry
nil
