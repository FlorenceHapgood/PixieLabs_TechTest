# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require './lib/dealer'
require './lib/calculator'
require './lib/formatter'

# This is the Controller.
class Poker < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  # Creates an error message if the quantities are wrong.
  post '/save_quantities' do
    if params[:num_players].to_i * params[:num_cards].to_i > 52
      flash[:error] = "Those numbers don't work, please rethink your quantities"
      redirect '/'
    else
      session[:num_players] = params[:num_players]
      session[:num_cards] = params[:num_cards]
      redirect '/dealing'
    end
  end

  get '/dealing' do
    @dealer = Dealer.new
    @dealer.deal(session[:num_players], session[:num_cards])

    #  Passes the record of scores created from the Dealer class
    # to the calculator class, to return a statement about
    # the winner(s).

    calculator = Calculator.new
    @statement = calculator.find_winners(@dealer.record)

    # Pass the record to the formatter class to make the scores look nice:
    # with Jack, Queen and King replacing 11, 12, 13
    formatter = Formatter.new
    @transformed_record = formatter.nums_to_characters(@dealer.record)

    erb(:dealing)
  end
end
