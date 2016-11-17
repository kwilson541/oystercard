require 'journeylog'

describe JourneyLog do

  subject(:journeylog) { described_class.new }

  it 'is expected to start a journey' do
    journeylog.start(entry_station)
    expect(journeylog.entry_station).to eq entry_station
  end

end
