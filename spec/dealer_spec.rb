require 'dealer'

describe Dealer do

  let(:dealer) { described_class.new }

  describe "#deal" do
    it "#deals the cards" do
      expect(dealer.deal("5", "4")).to eq([{}])
    end

  end
end
