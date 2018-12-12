require 'sinatra/base'
require './lib/game_setup'
require 'sinatra/flash'

class Poker < Sinatra::Base

  enable :sessions
  enable :method_override #take out?

  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  post '/save_quantities' do
    if params[:num_players].to_i * params[:num_cards].to_i >= 52
      flash[:error] = "Those numbers don't work, please rethink your quantities"
      redirect "/"
    else
      session[:num_players] = params[:num_players]
      session[:num_cards] = params[:num_cards]
      redirect '/dealing'
    end

  end

  get'/dealing' do
    @players = session[:num_players]
    @cards = session[:num_cards]
    erb(:dealing)

  end

end
