class Journey

	PENALTY_FARE = 6
	MINIMUM_FARE = 1

	attr_reader :entry_station, :exit_station

	def initialize
		@entry_station
		@exit_station
	end

	def start_journey(station)
		@entry_station = station
	end

	def end_journey(station)
		@exit_station = station
		self
	end

	def fare
		return PENALTY_FARE unless complete?
		MINIMUM_FARE
	end

	def complete?
		entry_station != nil && exit_station != nil
	end

end