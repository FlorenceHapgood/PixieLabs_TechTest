# frozen_string_literal: true

# Dealer Class deals the cards
class Dealer
  attr_reader :record

  # The record array is ready to store all the players and their hands. The hand
  # array is to temporarily store each player's hand.
  def initialize
    @deck = [{ Hearts: 1 }, { Diamonds: 1 }, { Spades: 1 }, { Clubs: 1 },
             { Hearts: 2 }, { Diamonds: 2 }, { Spades: 2 }, { Clubs: 2 },
             { Hearts: 3 }, { Diamonds: 3 }, { Spades: 3 }, { Clubs: 3 },
             { Hearts: 4 }, { Diamonds: 4 }, { Spades: 4 }, { Clubs: 4 },
             { Hearts: 5 }, { Diamonds: 5 }, { Spades: 5 }, { Clubs: 5 },
             { Hearts: 6 }, { Diamonds: 6 }, { Spades: 6 }, { Clubs: 6 },
             { Hearts: 7 }, { Diamonds: 7 }, { Spades: 7 }, { Clubs: 7 },
             { Hearts: 8 }, { Diamonds: 8 }, { Spades: 8 }, { Clubs: 8 },
             { Hearts: 9 }, { Diamonds: 9 }, { Spades: 9 }, { Clubs: 9 },
             { Hearts: 10 }, { Diamonds: 10 }, { Spades: 10 }, { Clubs: 10 },
             { Hearts: 11 }, { Diamonds: 11 }, { Spades: 11 }, { Clubs: 11 },
             { Hearts: 12 }, { Diamonds: 12 }, { Spades: 12 }, { Clubs: 12 },
             { Hearts: 13 }, { Diamonds: 13 }, { Spades: 13 }, { Clubs: 13 }]
    @record = []
    @hand = []
  end

  # The deal method receives the number of players and cards to be dealt from
  # the Controller. It calls to shuffle to shuffle the cards. It then calls to
  # gets_card method to put a random card into the hand array, as many times
  # as is necesary for each player to have their cards.
  def deal(num_players, num_cards)
    shuffle
    players_counter = 0
    while players_counter != num_players.to_i
      @hand = []
      num_cards.to_i.times { get_card }
      # Now that the player has an array with their hand of cards, this is
      # stored, along with their name, as a hash into the record array.
      @record << { :"Player number #{ players_counter + 1 }" => @hand }
      players_counter += 1
    end
  end

  private

  # Shuffles the cards
  def shuffle
    @deck.shuffle
  end

  # Gets a random card from the deck and stores it in an array. It calls to the
  # delete method.
  def get_card
    card = @deck.sample
    delete_card(card)
    @hand << card
  end

  # It deletes the card that was chosen from the deck, so that another player
  # cannot be dealt that card.
  def delete_card(card)
    @deck.delete(card)
  end
end
