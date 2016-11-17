require 'journey'

describe Journey do

	subject(:journey) { described_class.new }
	let(:station) { double(:station) }

	it 'has an entry station when a journey is started' do
		journey.start_journey(station)
		expect(journey.entry_station).to eq station
	end

	it 'has an exit station when a journey is ended' do
		journey.end_journey(station)
		expect(journey.exit_station).to eq station
	end

	it 'returns itself when journey is ended' do
		expect(journey.end_journey(station)).to eq journey
	end

	describe '#complete' do

		it 'knows if a journey is incomplete' do
			expect(journey).not_to be_complete
		end

		it 'knows if a journey is complete' do
			journey.start_journey(station)
			journey.end_journey(station)
			expect(journey).to be_complete
		end

	end

	describe '#fare' do

		it 'has a default fare of penalty fare' do
			expect(journey.fare).to eq Journey::PENALTY_FARE
		end

		it 'calculates a fare' do
			journey.start_journey(station)
			journey.end_journey(station)
			expect(journey.fare).to eq 1
		end

		it 'gives a penalty fare if exit station is missing' do
			journey.start_journey(station)
			expect(journey.fare).to eq Journey::PENALTY_FARE
		end

		it 'gives a penalty fare if entry station is missing' do
			journey.end_journey(station)
			expect(journey.fare).to eq Journey::PENALTY_FARE
		end

	end

end
