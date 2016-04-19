class Oystercard

  BALANCE_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
    @status = false
  end

  def top_up(amount)
    @amount = amount

   fail "balance should not exceed £#{BALANCE_LIMIT}"  if reach_limit?
   @balance += amount
  end

  def deduct(amount)
   @balance -= amount
  end

  def in_journey?
     @status
  end

  def touch_in
    @status = true
    in_journey?
  end

  def touch_out
    @status = false
    in_journey?
  end

  def reach_limit?
    @balance + @amount > BALANCE_LIMIT
  end

end
