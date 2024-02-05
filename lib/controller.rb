require 'Gossip'
require 'sinatra'

class ApplicationController < Sinatra::Base
  get '/gossips' do
    erb :new_gossip
  end

  get '/gossips/new/' do
    erb :new_gossip
  end
    
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save 
    redirect '/gossips/show'
  end

  get '/gossips/show' do
    erb :gossip_show, locals: { gossips: Gossip.all }
  end

  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end
end
get '/edit_gossip' do
  erb :edit_gossip
end

