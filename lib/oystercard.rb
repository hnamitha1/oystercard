class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  PENALTY = 6
  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey

  def initialize(journey = Journey.new)
    @balance = 0
    @journeys = []
    @journey = journey
  end

  def top_up(amount)
    @amount = amount

   fail "balance should not exceed £#{BALANCE_LIMIT}"  if reach_limit?
   @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "insufficient balance" if @balance < MINIMUM_BALANCE
    @entry_station = journey.start_journey(station)    
  end

  def touch_out(station)
    @exit_station = journey.finish_journey(station)
    @journeys << { entry_station: @entry_station, exit_station: @exit_station }
    deduct(journey.fare)
    @entry_station = nil
  end

  private

  def deduct(amount)
   @balance -= amount
  end

  def reach_limit?
    @balance + @amount > BALANCE_LIMIT
  end

end
