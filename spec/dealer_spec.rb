require 'dealer'

describe Dealer do

  let(:dealer) { described_class.new }


#we only need to test that it creates records well, not how 
  describe "#deal" do
    it "#deals the cards" do
      dealer.deal(1, 1)
      expect(dealer.record).not_to eq([{}]) #length to be 4,
    end

  end
end
