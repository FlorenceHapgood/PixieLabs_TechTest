require './lib/calculator'

describe Calculator do
  describe '#find_winner' do
    it "Calcultates who's won" do
      calculator = Calculator.new
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
      expect(calculator.find_winner(record)).to eq("Player number 1")
    end
  end
end
