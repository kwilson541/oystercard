require 'oystercard.rb'

describe OysterCard do
 	subject(:card) {described_class.new}

 	describe 'Card balance' do

    it 'expects a new card to have initial balance of 0' do
     	expect(card.balance).to eq 0
    end

    it { expect(card).to respond_to(:top_up).with(1).argument }

    it 'expects card to be able to be topped up' do
    	card.top_up(10)
    	expect(card.balance).to eq 10
    end

    it { expect(card).to respond_to(:deduct).with(1).argument }

    it 'expects fares to be deducted from card balance' do
    	card.top_up(10)
    	card.deduct(5)
    	expect(card.balance).to eq 5
    end

    context 'error checks' do

      it 'should raise error when exceeding maximum balance' do
        message = "Maximum balance of £#{OysterCard::MAXIMUM_BALANCE} cannot be exeeded"
        expect {card.top_up(100)}.to raise_error message
      end

      it 'should raise error when touching in with less than minimum balance' do
      	message = "Insufficient funds, minimum fare is £#{OysterCard::MINIMUM_BALANCE}"
      	expect {card.touch_in}.to raise_error message
      end

    end

  end

  describe 'Touch functionality' do

    before(:each) do
      card.top_up(10)
      card.touch_in
    end

    it { expect(card).to respond_to(:touch_in) }

    it 'should return true if touched in' do
      expect(card.in_use).to eq true
    end

    it { expect(card).to respond_to(:touch_out) }

    it 'should return false if touched out' do
      card.touch_out
      expect(card.in_use).to eq false
    end

    it { expect(card).to respond_to(:in_journey?) }

    it 'should return true if touched in' do
      expect(card).to be_in_journey
    end

    it 'should return false if touched out' do
      card.touch_out
      expect(card).not_to be_in_journey
    end


  end
end
