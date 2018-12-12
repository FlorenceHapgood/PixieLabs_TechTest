require 'sinatra/base'
require './lib/game_setup'

class Poker < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/save_players'do
    session[:num_players] = params[:num_players]
    redirect "/cards"
  end

  get '/cards' do
    
  end


end
