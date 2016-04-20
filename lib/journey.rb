class Journey

 MINIMUM_FARE = 1
 PENALTY_FARE = 6
 
 attr_accessor :entry_station,:exit_station
  
  def initialize(entry_station)
    @entry_station = entry_station
    @complete = false
  end

  def exit(exit_station)
    @exit_station = exit_station
    @complete = true
    self
  end

  def journey_complete?
    @complete
  end
  
  def fare
    return MINIMUM_FARE if journey_complete?
    PENALTY_FARE
  end

end
