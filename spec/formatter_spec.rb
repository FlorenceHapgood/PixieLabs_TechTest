# frozen_string_literal: true

require 'formatter'

describe Formatter do
  describe '#formatting' do
    it 'Replaces 11, 12, and 13 with their royal counterparts' do
      formatter = Formatter.new
      record = [{ "Player number 1": [{ Spades: 12 },
                                      { Diamonds: 13 },
                                      { Diamonds: 3 }] },
                { "Player number 2": [{ Clubs: 6 },
                                      { Hearts: 11 },
                                      { Hearts: 4 }] },
                { "Player number 3": [{ Clubs: 1 },
                                      { Clubs: 12 },
                                      { Diamonds: 4 }] }]
      expect(formatter.nums_to_characters(record)).to eq([{ "Player number 1": [{ Spades: 'Queen' }, { Diamonds: 'King' }, { Diamonds: 3 }] },
                                                          { "Player number 2": [{ Clubs: 6 }, { Hearts: 'Jack' }, { Hearts: 4 }] },
                                                          { "Player number 3": [{ Clubs: 1 }, { Clubs: 'Queen' }, { Diamonds: 4 }] }])
    end
  end
end
