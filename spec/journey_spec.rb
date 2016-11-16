require 'journey'

describe Journey do

  it { is_expected.to respond_to(:entry_station) }

  it { is_expected.to respond_to(:exit_station) }

end
