# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require './lib/dealer'
require './lib/calculator'
require './controller_helper'

# This is the Controller.
class Poker < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

# The error_message is stored in the controller_helper
  post '/save_quantities' do
    error_message
  end

  get '/dealing' do
    @dealer = Dealer.new
    @dealer.deal(session[:num_players], session[:num_cards])

    # Passes the record of scores created from the dealer class
    # to the calculator class, to return a statement about
    # the winner(s).
    calculator = Calculator.new
    @statement = calculator.find_winners(@dealer.record)
    erb(:dealing)
  end
end
