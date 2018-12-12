class Dealer

  attr_reader :deck

  def initialize

    @deck = [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6,
          6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11,
          11, 12, 12, 12, 12, 12, 13, 13, 13, 13]
    @record = []
  end

  def deal(players, cards)
    deck.shuffle
    num_players_counter = 0
    while num_players_counter != players
       hand = []
       cards.times { hand << @deck.sample } #Need to remove the cards.
       @record << { "Player number #{ num_players_counter + 1 }" => hand}
       num_players_counter += 1
    end

    print @record
  end



end
