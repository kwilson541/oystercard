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

  end
end
