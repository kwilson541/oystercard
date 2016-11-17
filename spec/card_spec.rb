require 'card'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:exit_station) }
  let(:journey_log) { double(:journey_log) }

  it 'should be initialized with a default balance of 0' do
    expect(oystercard.balance).to eq 0
  end

  it 'should be initialized with an new journey log' do
    expect(oystercard.journey_log.journeys).to eq []
  end

  describe 'when using top_up' do

    it 'increases the balance' do
      oystercard.top_up(5)
      expect(oystercard.balance).to eq 5
    end

    it 'it raises error if trying to exceed maximum balance of £90' do
      oystercard.top_up(90)
      expect{oystercard.top_up(1)}.to raise_error "Can't exceed maximum balance of £90."
    end

  end

  describe 'when using touch in' do

    it 'should raise an error if balance is below minimum journey fare' do
      expect{oystercard.touch_in(entry_station)}.to raise_error "Cannot touch in: minimum required balance is £1, please top up."
    end

    it { is_expected.to respond_to(:touch_in).with(1).argument }

  end

  describe 'when using touch out' do

    it 'should deduct the minimum journey ammount' do
      allow(journey_log).to receive(:finish)
      expect{oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by(-1)
    end

    it { is_expected.to respond_to(:touch_out).with(1).argument }

  end

end







