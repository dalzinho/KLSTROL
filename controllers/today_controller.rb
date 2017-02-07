require 'sinatra'
require 'sinatra/contrib/all'
require './models/deal'
require './models/linkdealsburgers'

get '/today/:id' do
  #this is for the page heading
  @deal = Deal.find(params[:id])
  #these are the results of the deal/burgers link table, for getting search ids.
  @included = LinkDealsBurgers.find(params[:id])
  # get all the deals
  @deals = Deal.all
  # get an array of all burgers
  @burgers = Burger.all
  erb(:"/today/show")
end