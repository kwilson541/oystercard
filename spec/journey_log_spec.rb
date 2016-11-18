require 'journey_log'

describe JourneyLog do

	let(:station) { double(:station) }
	let(:journey) { double(:journey) }
	let(:journey_klass) { double(:journey_klass, new: journey) }
	subject(:journey_log) { described_class.new(journey_klass) }

	it 'should be initialized with an empty journey history' do
   		expect(journey_log.journey_history).to eq []
	end

	it 'should be initialized with a journey_klass parameter' do
		expect(journey_log.journey_klass).to eq journey_klass
	end

	describe '#start' do

		it 'starts a new journey' do
			expect(journey_log.start(station)).to eq journey
		end

	end

	describe '#finish' do

		it 'records a journey' do
	    	journey_log.start(station)
	    	journey_log.finish(station)
	   		expect(journey_log.journey_history).to eq [{ :journey_start => station, :journey_end => station}]
		end

	end

end