require './lib/calculator'

describe Calculator do

  let(:calculator) { described_class.new }

  describe '#find_winner' do
    it "Returns an array of winners, in the case of one winner" do
      record = [{:"Player number 1"=>[{:Spades=>12},
                                      {:Diamonds=>13},
                                      {:Diamonds=>3}]
                                      },
                {:"Player number 2"=>[{:Clubs=>6},
                                     {:Hearts=>11},
                                     {:Hearts=>4}]
                                     },
               {:"Player number 3"=>[{:Clubs=>1},
                                    {:Clubs=>12},
                                    {:Diamonds=>4}]
                                      }]
      expect(calculator.find_winner(record)).to eq(["Player number 1"])
    end

    it "Returns an array of winners, in the case of more than one winner" do
      record = [{:"Player number 1"=>[{:Spades=>1},
                                      {:Diamonds=>1},
                                      {:Diamonds=>1}]
                                      },
                {:"Player number 2"=>[{:Clubs=>1},
                                     {:Hearts=>1},
                                     {:Hearts=>2}]
                                     },
               {:"Player number 3"=>[{:Clubs=>1},
                                    {:Clubs=>1},
                                    {:Diamonds=>2}]
                                      }]
      expect(calculator.find_winner(record)).to eq(["Player number 2", "Player number 3"])
   end
  end

  describe "#winner_or_winners" do
    it "returns a statement that is plural or singular depending on number of winners" do
      result = ["Player number 2", "Player number 3"]
      expect(calculator.winner_or_winners(result)).to eq("And the winners are:")
    end
  end

end
