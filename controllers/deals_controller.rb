require 'sinatra'
require 'sinatra/contrib/all'
require './models/Deal'
require './models/Burger'
require './models/LinkDealsBurgers'

get '/deals' do
  @deals = Deal.all
  erb (:"deals/index")
end

get '/deals/new' do
  erb(:"deals/new")
end

post '/deals' do
  @deal = Deal.new(params)
  @deal.save
  redirect to ('/deals')
end

get '/deals/:id/add' do
  @deal = Deal.find(params[:id])
  @burgers = Burger.get_by_vendor(@deal.vendor_id)
  erb(:"deals/add")
end

post '/deals/:id/add' do
  @deal = Deal.find(params[:id])
  # @burgers = Burger.get_by_vendor(@deal.vendor_id)
  @link = LinkDealsBurgers.new(params)
  @link.save
  redirect to ("/deals/#{params[:id]}")
end

get '/deals/:id/edit' do
  @deal = Deal.find(params[:id])
  erb(:"/deals/edit")
end

get '/deals/:id' do
  @deal = Deal.find(params[:id])
  @burgers = LinkDealsBurgers.find(params[:id])
  erb(:"deals/show")
end

post '/deals/:id/delete' do
  Deal.delete(params[:id])
  redirect to ('/deals')
end

post '/deals/:id' do
  @deal = Deal.update(params)
  redirect to ('/deals')
end

