class JourneyLog

	attr_reader :journey_klass, :journey_history, :entry_station, :exit_station

	def initialize(journey_klass)
		@journey_klass = journey_klass
		@journey_history = []
	end

	def start(station)
		@entry_station = station
		new_journey
	end

	def finish(station)
		@exit_station = station
		store_journey
	end

	private

		def new_journey
			@journey = journey_klass.new
		end

		def current_journey
			{ :journey_start => entry_station, :journey_end => exit_station}
		end

		def store_journey
			journey_history << current_journey
		end

end