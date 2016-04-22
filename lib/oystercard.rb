require_relative 'journeylog'

class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  PENALTY = 6
  attr_reader :balance,:journeylog

  def initialize(journeylog = JourneyLog.new(Journey))
    @balance = 0
    @journeylog = journeylog
  end
  
  def top_up(amount)
    @amount = amount
    fail "balance should not exceed £#{BALANCE_LIMIT}"  if reach_limit?
    @balance += amount
  end

  def touch_in(station)
    fail "insufficient balance" if @balance < MINIMUM_BALANCE
    @journeylog.begin_journey(station)    
  end

  def touch_out(station)
    exit_station = @journeylog.end_journey(station)
    #@journeys << { entry_station: @entry_station, exit_station: @exit_station }
    deduct(exit_station.fare)
    #@entry_station = nil
  end

  private

  def deduct(amount)
   @balance -= amount
  end

  def reach_limit?
    @balance + @amount > BALANCE_LIMIT
  end

end
