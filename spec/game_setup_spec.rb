require 'game_setup'

describe Game_Setup do

  let(:game_setup) { described_class.new }

  describe '#num_players' do
    it 'asks the user for the number of players' do
      expect { game_setup.num_players }.to output("Welcome! How many are playing?\n").to_stdout
    end
  end

  describe '#num_cards' do
    it 'asks the user for the number of cards to be dealt to each player' do
      expect { game_setup.num_cards }.to output("How many cards should each player be dealt?\n").to_stdout
    end
  end



end
