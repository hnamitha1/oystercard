require 'journey'

class Journeylog
  
  attr_reader :journeys,:journey

  def initialize
  	@journeys = []
  	@journey = Journey.new
  end	

  def journeylogs
  	entry_station = @journey.entry_station
  	exit_station = @journey.exit_station
    @journeys << { entry_station: entry_station, exit_station: exit_station }
  end
 
end
