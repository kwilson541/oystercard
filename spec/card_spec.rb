require 'card'

describe Oystercard do

	subject(:oystercard) { described_class.new(Journey) }
	let(:entry_station) { double(:entry_station) }
	let(:exit_station) { double(:exit_station) }

	it 'should be initialized with a default balance of 0' do
    	expect(oystercard.balance).to eq 0
	end

	it 'should be initialized with an empty journey history' do
   		expect(oystercard.journey_history).to eq []
	end

	describe '#top_up' do
    
    	it 'increases the balance' do
    		oystercard.top_up(5)
    		expect(oystercard.balance).to eq 5
    	end

    	it 'it raises error if trying to exceed maximum balance of £90' do
    		oystercard.top_up(90)
    		expect{oystercard.top_up(1)}.to raise_error "Can't exceed maximum balance of £90."
    	end

	end

	describe '#touch_in' do

		it 'should raise an error if balance is below minimum journey amount of £1' do
      		expect{oystercard.touch_in(entry_station)}.to raise_error "Cannot touch in: minimum required balance is £1, please top up."
    	end

    	it { is_expected.to respond_to(:touch_in).with(1).argument }

	end

	describe '#touch_out' do

		it 'should deduct the fare for a complete journey' do
    		oystercard.top_up(2)
    		oystercard.touch_in(entry_station)
    		expect{oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by(-1)
		end

    	it { is_expected.to respond_to(:touch_out).with(1).argument }

  	end

	describe '#journey_history' do

    	it 'expects journey history to be stored' do
    		oystercard.top_up(2)
    		oystercard.touch_in(entry_station)
    		oystercard.touch_out(exit_station)
    		expect(oystercard.journey_history).to eq [{ :journey_start => entry_station, :journey_end => exit_station}]
		end

  end

end







