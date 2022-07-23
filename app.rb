require "bundler/setup"
Bundler.require
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/cross_origin'
require 'json'
require 'eth'
require 'rmagick'
require './abi.rb'
set :bind, '0.0.0.0'
set :protection, :except => :json_csrf
configure do enable :cross_origin end

enable :sessions #これでsessionが使える

get '/' do 
  redirect 'https://sz.senzai.app/' 
end

get '/senzai/metadata/:num' do
  cross_origin
  content_type :json
  fileID = params[:num]
  if !fileID.include?(".json")
    fileID = fileID + ".json"
  end
  fileID.split(".")[1]
  hash = File.open("json/#{fileID}"){ |f| JSON.load(f) }
  alreadyMintCheck(fileID.split(".")[0].to_i) ? hash.to_json : "it is not mint yet"
end

get '/senzai/images/:num' do
  cross_origin
  if alreadyMintCheck(params[:num].split(".")[0].to_i)
    send_file "images/#{params[:num]}"
  else
    "it is not mint yet"
  end
end

get '/raw_images/:num' do
  cross_origin
  if alreadyMintCheck(params[:num].split(".")[0].to_i)
    send_file "raw_images/#{params[:num]}"
  else
    "it is not mint yet"
  end
end


# get '/dressup' do
#   @signrand = 'Ethereum Signed Message:'+rand(10000).to_s
#   session[:rand] = @signrand
#   @title = "SENZAI-dressup-"
#   @clothesPath = ['assets/clothesFemale/', 'assets/clothesMale/']
#   @clothesNames = []
#   for i in 0..1
#     @clothesNames.push(allNamesInFolder("public/"+@clothesPath[i]))
#   end
#   erb :dressup
# end

post '/dress' do
  owned = ownerValidate(session[:rand], params[:target], params[:sign])
  done =false
  if owned
    body = Magick::Image.read("public/assets/origin/origin-#{params[:target]}.png").first
    path = params[:sex] == "Wom" ? "clothesFemale" : "clothesMale"
    cloth = Magick::Image.read(imgpath(path, params[:cloth])).first
    body.composite!(cloth, Magick::SouthWestGravity, Magick::OverCompositeOp)
    body.write("images/#{params[:target]}.png")
    jsonpath = "json/#{params[:target]}.json"
    hash = File.open(jsonpath) { |f| JSON.load(f) } 
    hash["attributes"][6]["value"] = params[:cloth].split(".")[0]
    File.open(jsonpath, "w") { |f| JSON.dump(hash, f) }
    done = true
  end
  redirect "/dressuped/#{params[:target]}/#{done}"
end

get '/dressuped/:target/:done' do
  erb :dressuped
end

def ownerValidate(signMsg, tokenid, signature)
  addr = "0x9c8230d31F9f513901685f91FA18B3C038118A1E"
  cli = Eth::Client.create "https://mainnet.infura.io/v3/91ee6f7916c2401da3e84e67d4d4be20"
  contract = Eth::Contract.from_abi(name: "SENZAI", address: addr, abi: getAbi())
  public_key = Eth::Signature.personal_recover(signMsg, signature)
  address = Eth::Util.public_key_to_address(public_key)
  owner = cli.call(contract, "ownerOf", tokenid.to_i)
  if address.to_s.upcase == owner.to_s.upcase
    return true
  else
    return false
  end
end

def alreadyMintCheck(num)
  addr = "0x9c8230d31F9f513901685f91FA18B3C038118A1E"
  cli = Eth::Client.create "https://mainnet.infura.io/v3/91ee6f7916c2401da3e84e67d4d4be20"
  contract = Eth::Contract.from_abi(name: "SENZAI", address: addr, abi: getAbi())
  result = num <= cli.call(contract, "totalSupply") ? true : false
  return result
end

def allNamesInFolder(path)
  results = []
  Dir.foreach(path) do |item|
    item[0] == "." ? next : ""
    results.push(item)
  end
  return results
end

def imgpath(folder, num)
  return "public/assets/#{folder}/#{num}"
end