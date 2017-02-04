require 'sinatra'
require 'sinatra/contrib/all'
require './models/burger'

get '/burgers' do
  @burgers = Burger.all
  erb(:"burgers/index")
end

get '/burgers/:id/edit' do
  @burger = Burger.find(params[:id])
  erb(:"burgers/edit")
end

get '/burgers/:id' do
  @burger = Burger.find(params[:id])
  erb(:"burgers/show")
end

post '/burgers/:id' do
  @burger = Burger.update(params)
  redirect to ('/burgers')
end

