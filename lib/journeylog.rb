require_relative 'journey'

class JourneyLog

	attr_reader :journeys

  def initialize(journey_klass)
    @journey_class = journey_klass.new
    @journeys = []
  end



end
