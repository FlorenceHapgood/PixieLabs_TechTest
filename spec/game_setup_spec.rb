require 'game_setup'

describe Game_Setup do

  let(:game_setup) { described_class.new }

  describe "#num_players" do
    it "asks the user for the number of players" do
      expect { game_setup.num_players }.to output("Welcome! How many are playing?\n").to_stdout
    end

  end

end
