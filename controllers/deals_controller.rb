require 'sinatra'
require 'sinatra/contrib/all'
require './models/Deal'

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

get '/deals/:id/edit' do
  @deal = Deal.find(params[:id])
  erb(:"/deals/edit")
end

get '/deals/:id' do
  @deal = Deal.find(params[:id])
  erb(:"deals/show")
end

post '/deals/:id' do
  @deal = Deal.update(params)
  redirect to ('/deals')
  end