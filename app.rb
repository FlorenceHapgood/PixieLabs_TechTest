require 'sinatra/base'
require './lib/game_setup'

class Poker < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/save_players'do
    session[:num_players] = params[:num_players]
    redirect '/cards'
  end

  get '/cards' do
    erb(:cards)
  end

  post '/save_cards' do
    session[:num_cards] = params[:num_cards]
    redirect '/dealing'
  end

  get'/dealing' do
    @players = session[:num_players]
    @cards = session[:num_cards]
    erb(:dealing)
  end

end
