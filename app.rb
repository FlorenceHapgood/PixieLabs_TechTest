require 'sinatra/base'
require './lib/game_setup'
require 'sinatra/flash'
require './lib/dealer'

class Poker < Sinatra::Base

  enable :sessions

  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  post '/save_quantities' do
    if params[:num_players].to_i * params[:num_cards].to_i >= 52 #can refactor somewhere else
      flash[:error] = "Those numbers don't work, please rethink your quantities"
      redirect "/"
    else
      session[:num_players] = params[:num_players]
      session[:num_cards] = params[:num_cards]
      redirect '/dealing'
    end

  end

  get'/dealing' do
    players = session[:num_players].to_i
    cards = session[:num_cards].to_i
    @dealer = Dealer.new
    @dealer.deal(players, cards)

    erb(:dealing)
  end

end
