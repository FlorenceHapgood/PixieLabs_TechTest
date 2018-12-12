require 'sinatra/base'

class Poker < Sinatra::Base
  get '/' do
    'hello poker'
  end
end
