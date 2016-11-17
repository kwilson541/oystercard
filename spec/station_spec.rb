require 'station'

describe Station do

	subject(:station) {described_class.new("Aldgate", 1)}

	it 'returns the name that was set when it was initialized' do
		expect(station.name).to eq "Aldgate"
	end

	it 'returns the zone that was set when it was initialized' do
		expect(station.zone).to eq 1
	end

end
