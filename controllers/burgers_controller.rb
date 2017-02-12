require 'sinatra'
require 'sinatra/contrib/all'
require './models/burger'

get '/burgers' do
  @burgers = Burger.all
  erb(:"burgers/index")
end

get '/burgers/new' do
  erb(:"burgers/new")
end

post '/burgers' do
@burger = Burger.new(params)
@burger.save
# return "saved!"
redirect to ('/burgers')
  end

get '/burgers/:id/edit' do
  @burger = Burger.find(params[:id])
  erb(:"burgers/edit")
end

get '/burgers/:id' do
  @burger = Burger.find(params[:id])
  erb(:"burgers/show")
end

post '/burgers/:id/delete' do
  Burger.delete(params[:id])
  redirect to ('/burgers')

end

post '/burgers/:id' do
  @burger = Burger.update(params)
  redirect to ('/burgers')
end

