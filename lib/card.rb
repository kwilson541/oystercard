class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_JOURNEY = 1

  attr_reader :balance, :entry_station, :exit_station, :journey_history

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
    @journey_history = []
  end

  def top_up(top_up_value)
    raise "Can't exceed maximum balance of £#{MAXIMUM_BALANCE}." if maximum?(top_up_value)
    @balance += top_up_value
  end

  def touch_in(entry_station)
    raise "Cannot touch in: minimum required balance is £#{MINIMUM_JOURNEY}, please top up." if minimum?
    @exit_station = nil
    @entry_station = entry_station
    @journey[:journey_start] = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_JOURNEY)
    @entry_station = nil
    @exit_station = exit_station
    @journey[:journey_end] = exit_station
    store_journey
  end

  def in_journey?
    @entry_station != nil
  end

  private
    def deduct(fare)
      @balance -= fare
    end

    def minimum?
      balance < MINIMUM_JOURNEY
    end

    def maximum?(top_up_value)
      @balance + top_up_value > MAXIMUM_BALANCE
    end

    def journey
      @journey = { :journey_start => nil, :journey_end => nil }
    end

    def store_journey
      @journey_history << @journey
      @journey[:journey_start] = nil
      @journey[:journey_end] = nil
    end

end
