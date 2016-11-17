require_relative 'journey'

class JourneyLog

	attr_reader :journeys, :entry_station, :exit_station

	def initialize
		@journeys = []
	end

	def start(entry_station)
		@entry_station = entry_station
	end

	def finish(exit_station)
		@exit_station = exit_station
		complete_journey
		store_journey
	end

	def complete_journey
		{ :journey_start => @entry_station, :journey_end => @exit_station }
	end

	def store_journey
		journeys << complete_journey
	end

end
