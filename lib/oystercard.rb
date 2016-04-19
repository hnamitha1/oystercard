class Oystercard

  BALANCE_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @amount = amount

   fail "balance should not exceed £#{BALANCE_LIMIT}"  if reach_limit?
   @balance += amount
  end

  def reach_limit?
    @balance + @amount > BALANCE_LIMIT
  end

end
