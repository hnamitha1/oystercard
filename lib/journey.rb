class Journey

 MINIMUM_FARE = 1
 PENALTY_FARE = 6
 
 attr_accessor :entry_station,:exit_station

  def start_journey(entry_station)
  	@entry_station = entry_station
  end

  def finish_journey(exit_station)
  	@exit_station = exit_station
    self
  end

  def journey_complete?
    !!(entry_station && exit_station)
  end

  def fare
    journey_complete? ? MINIMUM_FARE : PENALTY_FARE
  end

end
