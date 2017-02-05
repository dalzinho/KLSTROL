require 'sinatra'
require 'sinatra/contrib/all'
require './models/Deal'

get '/deals' do
  @deals = Deal.all
  erb (:"deals/index")
end