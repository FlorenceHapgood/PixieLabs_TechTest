# frozen_string_literal: true

require 'dealer'

describe Dealer do
  let(:dealer) { described_class.new }

  describe '#deal' do
    it '#deals the cards' do
      srand(100)
      dealer.deal(2, 2)
      expect(dealer.record).to eq([{ "Player number 1": [{ Hearts: 13 },
                                                         { Clubs: 12 }] },
                                   { "Player number 2": [{ Clubs: 10 },
                                                         { Spades: 12 }] }])
    end
  end
end
