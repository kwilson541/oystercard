class Journey

	attr_reader :entry_station, :exit_station

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

end
