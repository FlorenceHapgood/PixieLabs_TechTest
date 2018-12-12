class Game_Setup

  def initialize
    @player_input = 'User_input'
    @cards_input = 'Num_input'
  end

  def num_players
    puts 'Welcome! How many are playing?'
    save_player_input
  end

  def num_cards
    puts 'How many cards should each player be dealt?'
    save_cards_input
  end

  private

  def save_player_input
    @player_input = gets.chomp.to_i
  end

  def save_cards_input
    @cards_input = gets.chomp.to_i
  end

end
