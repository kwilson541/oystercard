require 'journey_log'

describe JourneyLog do

	subject(:journey_log) { described_class.new }
	let(:entry_station) { double(:entry_station) }
	let(:exit_station) { double(:exit_station) }

	it 'creates empty journey log' do
		journey_log = JourneyLog.new
		expect(journey_log.journeys).to eq []
	end

	it 'is expected to start a journey' do
    	journey_log.start(entry_station)
    	expect(journey_log.entry_station).to eq entry_station
  	end

	it 'is expected to end a journey' do
		journey_log.finish(exit_station)
  		expect(journey_log.exit_station).to eq exit_station
	end

end
