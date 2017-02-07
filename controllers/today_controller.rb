require 'sinatra'
require 'sinatra/contrib/all'
require './models/deal'

get '/today/:id' do
  @deal = Deal.find(params[:id])
  @burgers = Burger.get_by_vendor(@deal.vendor_id)
  erb(:"/today/show")
end