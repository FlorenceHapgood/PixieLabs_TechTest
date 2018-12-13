class Dealer

  attr_reader :record

  def initialize

    @deck = [{Hearts: 1}, {Diamonds: 1}, {Spades: 1}, {Clubs: 1},
         {Hearts: 2}, {Diamonds: 2}, {Spades: 2}, {Clubs: 2},
         {Hearts: 3}, {Diamonds: 3}, {Spades: 3}, {Clubs: 3},
         {Hearts: 4}, {Diamonds: 4}, {Spades: 4}, {Clubs: 4},
         {Hearts: 5}, {Diamonds: 5}, {Spades: 5}, {Clubs: 5},
         {Hearts: 6}, {Diamonds: 6}, {Spades: 6}, {Clubs: 6},
         {Hearts: 7}, {Diamonds: 7}, {Spades: 7}, {Clubs: 7},
         {Hearts: 8}, {Diamonds: 8}, {Spades: 8}, {Clubs: 8},
         {Hearts: 9}, {Diamonds: 9}, {Spades: 9}, {Clubs: 9},
         {Hearts: 10}, {Diamonds: 10}, {Spades: 10}, {Clubs: 10},
         {Hearts: 11}, {Diamonds: 11}, {Spades: 11}, {Clubs: 11},
         {Hearts: 12}, {Diamonds: 12}, {Spades: 12}, {Clubs: 12},
         {Hearts: 13}, {Diamonds: 13}, {Spades: 13}, {Clubs: 13},]
    @record = []
  end

  def deal(num_players, num_cards)
    @deck.shuffle #poss refactor?

    players_counter = 0
    while players_counter != num_players
       hand = []
       num_cards.times { hand << @deck.sample }
       #Need to remove the cards....
       @record << { :"Player number #{ players_counter + 1 }" => hand}
       players_counter += 1
    end
   
  end


end
