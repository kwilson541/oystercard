class Journey

	attr_reader :entry_station, :exit_station

	PENALTY_FARE = 6
	MINIMUM_FARE = 1

	def initialize
		@entry_station
		@exit_station
	end

	def start_journey(entry_station)
		@entry_station = entry_station
	end

	def end_journey(exit_station)
		@exit_station = exit_station
		complete_journey
	end

	def complete_journey
		{ :journey_start => @entry_station, :journey_end => @exit_station }
	end

	def store_journey(card)
		card.journey_history << complete_journey
	end

	def in_journey?
		entry_station != nil
	end

	def fare
		return MINIMUM_FARE if touched_in? && touched_out?
		PENALTY_FARE
	end

	private

		def touched_in?
			@entry_station != nil
		end

		def touched_out?
			@exit_station != nil
		end

end
