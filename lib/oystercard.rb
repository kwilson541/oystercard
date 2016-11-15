class OysterCard

  attr_reader :balance, :in_use
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @in_use = false
  end

  def top_up(amount)
    raise "Maximum balance of £#{OysterCard::MAXIMUM_BALANCE} cannot be exeeded" if maximum?(amount)
    @balance += amount
  end

  def deduct(amount)
  	@balance -= amount
  end

  def touch_in
  	raise "Insufficient funds, minimum fare is £#{OysterCard::MINIMUM_BALANCE}" if minimum?
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end

  private

  def maximum?(top_up_amount)
    @balance + top_up_amount > MAXIMUM_BALANCE
  end

  def minimum?
  	@balance < MINIMUM_BALANCE
  end

end
