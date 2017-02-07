require 'sinatra'
require 'sinatra/contrib/all'
require './models/deal'
require_relative 'controllers/vendors_controller'
require_relative 'controllers/burgers_controller'
require_relative 'controllers/deals_controller'
require_relative 'controllers/today_controller'

get '/' do
  @deals = Deal.get_today
  erb (:index)
end