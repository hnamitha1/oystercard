class Journey

 MINIMUM_FARE = 1
 PENALTY_FARE = 6
 
 attr_accessor :entry_station,:exit_station

  def start_journey(entry_station)
  	#self.journey[:entry_station] = entry_station
    @entry_station = entry_station
  end

  def finish_journey(exit_station)
  	#self.journey[:exit_station] = exit_station
    @exit_station = exit_station
    self
  end

  def journey_complete?
    !!(entry_station && exit_station)
    #(entry_station == nil || exit_station == nil)? false : true
  end

  def fare
    journey_complete? ? MINIMUM_FARE : PENALTY_FARE
    #return MINIMUM_FARE if journey_complete?
    #PENALTY_FARE
  end

end
