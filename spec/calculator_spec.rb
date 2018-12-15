# frozen_string_literal: true

require './lib/calculator'

describe Calculator do
  let(:calculator) { described_class.new }

  describe '#find_winners' do
    it 'returns a plural statement for multiple winners' do
      record = [{ "Player number 1": [{ Spades: 1 },
                                      { Diamonds: 1 },
                                      { Diamonds: 1 }] },
                { "Player number 2": [{ Clubs: 1 },
                                      { Hearts: 1 },
                                      { Hearts: 2 }] },
                { "Player number 3": [{ Clubs: 1 },
                                      { Clubs: 1 },
                                      { Diamonds: 2 }] }]
      expect(calculator.find_winners(record)).to eq('And the winners are:'\
                                                        ' Player number 2, '\
                                                        'Player number 3')
    end
    it 'returns a singular statement for one winner' do
      record = [{ "Player number 1": [{ Spades: 12 },
                                      { Diamonds: 13 },
                                      { Diamonds: 3 }] },
                { "Player number 2": [{ Clubs: 6 },
                                      { Hearts: 11 },
                                      { Hearts: 4 }] },
                { "Player number 3": [{ Clubs: 1 },
                                      { Clubs: 12 },
                                      { Diamonds: 4 }] }]
      expect(calculator.find_winners(record)).to eq('And the winner is:'\
                                                        ' Player number 1')
    end
  end
end
