class OysterCard

  attr_reader :balance
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(amount)
    raise "Maximum balance of #{OysterCard::MAXIMUM_BALANCE} cannot be exeeded" if maximum?(amount)
    @balance += amount
  end

  def deduct(amount)
  	@balance -= amount
  end

  private

  def maximum?(top_up_amount)
    @balance + top_up_amount > MAXIMUM_BALANCE
  end

end
