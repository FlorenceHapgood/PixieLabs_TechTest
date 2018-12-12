class Game_Setup

attr_reader :player_input

  def initialize
    @player_input = "User_input"
  end

  def num_players
    puts "Welcome! How many are playing?"
    save_player_input
  end


  private

  def save_player_input
    @player_input = gets.chomp.to_i
  end


end
