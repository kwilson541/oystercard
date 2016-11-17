require 'journeylog'

describe JourneyLog do

  subject(:journey_log) { described_class.new }

  it 'creates empty journey log on instantiation' do
  	expect(journey_log.journeys).to eq []
  end


end
