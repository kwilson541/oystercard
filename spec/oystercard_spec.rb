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

    context 'error checks' do

      it 'should raise error when exceeding maximum balance' do
        message = "Maximum balance of #{OysterCard::MAXIMUM_BALANCE} cannot be exeeded"
        expect {card.top_up(100)}.to raise_error(message)
      end

    end

  end
end
