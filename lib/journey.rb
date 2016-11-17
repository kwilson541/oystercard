require_relative 'journey_log'

class Journey

	attr_reader :entry_station, :exit_station

	PENALTY_FARE = 6
	MINIMUM_FARE = 1

	def initialize
		@entry_station
		@exit_station
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
