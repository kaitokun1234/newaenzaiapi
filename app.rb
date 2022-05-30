require "bundler/setup"
Bundler.require
require 'sinatra'
require 'json'
require 'sinatra/cross_origin'

set :bind, '0.0.0.0'

configure do
  enable :cross_origin
end

get '/' do
  "Z"
end

get '/show/:num' do
  cross_origin
  hash = File.open("numbersNFT/jsons/#{params[:num]}.json"){ |f| JSON.load(f) }
  #hash["image"] = "http://localhost:4567/images/#{params[:num]}.png"
  hash.to_json
end

get '/images/:num' do
  cross_origin
  @imgsrc = "/images/#{params[:num]}.png"
  erb :image
end

# post '/edit' do
#   body = request.body.read

#   if body == ''
#     status 400
#   else
#     body.to_json
#   end
# end
