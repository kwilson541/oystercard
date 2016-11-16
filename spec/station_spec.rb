require 'station'

describe Station do

  it 'returns the name that was set when it was initialized' do
    station = Station.new("Aldgate", 1)
    expect(station.name).to eq "Aldgate"
  end

  it 'returns the zone that was set when it was initialized' do
    station = Station.new("Aldgate", 1)
    expect(station.zone).to eq 1
  end

end
