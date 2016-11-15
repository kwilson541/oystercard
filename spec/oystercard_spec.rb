require 'oystercard.rb'

describe OysterCard do
  subject(:card) {described_class.new}

  describe 'Card setup' do

    it 'expects a new card to have initial balance of 0' do
      expect(card.balance).to eq 0
    end

  end
end
