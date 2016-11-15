class OysterCard

  attr_reader :balance
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum balance of £#{MAXIMUM_BALANCE} cannot be exeeded" if maximum?(amount)
    @balance += amount
  end


  def touch_in
  	raise "Insufficient funds, minimum fare is £#{MINIMUM_FARE}" if minimum?
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private
  
  def deduct(amount)
    @balance -= amount
  end

  def maximum?(top_up_amount)
    @balance + top_up_amount > MAXIMUM_BALANCE
  end

  def minimum?
  	@balance < MINIMUM_FARE
  end

end
