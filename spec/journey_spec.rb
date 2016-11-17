require 'journey'

describe Journey do

	subject(:journey) { described_class.new }
	let(:entry_station) { double(:entry_station) }
	let(:exit_station) { double(:exit_station) }

	it { is_expected.to respond_to(:store_journey) }

	it { is_expected.to respond_to(:start_journey) }

	it 'is expected to start a journey' do
    	journey.start_journey(entry_station)
    	expect(journey.entry_station).to eq entry_station
  	end

	it 'is expected to end a journey' do
		journey.end_journey(exit_station)
  		expect(journey.exit_station).to eq exit_station
	end

    it 'expects to complete a journey' do
    	journey.start_journey(entry_station)
    	journey.end_journey(exit_station)
    	expect(journey.complete_journey).to eq ({ :journey_start => entry_station, :journey_end => exit_station })
    end

    it { is_expected.to respond_to(:fare) }

    it 'expects penalty fare for no entry station' do
    	journey.end_journey(exit_station)
    	expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'expects a minimum fare for tocuhing in and touching out' do
    	journey.start_journey(entry_station)
    	journey.end_journey(exit_station)
    	expect(journey.fare).to eq 1
    end


	describe 'when asking if it is in journey' do

	    it 'it should be true if card has touched in' do
	    	journey.start_journey(entry_station)
	    	expect(journey.in_journey?).to eq true
	    end

	    it 'should be false if card has touched out' do
	    	journey.end_journey(exit_station)
	    	expect(journey.in_journey?).to be false
	    end

	end

end
