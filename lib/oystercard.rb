class Oystercard

  BALANCE_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
   fail 'balance should not exceed £90' if (amount + @balance) > BALANCE_LIMIT
   @balance += amount
  end

end
