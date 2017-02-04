require 'sinatra'
require 'sinatra/contrib/all'
require './models/vendor'


get '/vendors' do
  @vendors = Vendor.all
  erb (:"vendors/index")
end

get '/vendors/new' do
  erb(:"vendors/new")
end

post '/vendors' do
  @vendor = Vendor.new(params)
  @vendor.save
  return "saved"
end

get '/vendors/:id' do
  @vendor = Vendor.find(params[:id])
  erb(:"/vendors/show")
end

get '/vendors/:id/edit' do
  @vendor = Vendor.find(params[:id])
  erb(:"vendors/edit")
end

post '/vendors/:id/delete' do
  Vendor.destroy(params[:id])
  redirect to ('/vendors')
end

post '/vendors/:id' do
  @vendor = Vendor.update(params)
  redirect to ("/vendors/#{params[:id]}")
  end

