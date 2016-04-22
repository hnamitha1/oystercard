#require 'journey'

class JourneyLog
  
  attr_reader :journeys

  def initialize(journey_class)
  	@journeys = []
  	@journey_class = journey_class
  end	

  def begin_journey(station)
    @current_journey = journey_class.new
    add(@current_journey)
    @current_journey.start_journey(station)
  end

  def end_journey(station)
    @current_journey.finish_journey(station)
  end

  def journeys
    @journeys.dup
  end  

  def journeylogs
  	entry_station = @journey.entry_station
  	exit_station = @journey.exit_station
    @journeys << { entry_station: entry_station, exit_station: exit_station }
  end

  private

  attr_reader :journey_class

  def add(journey)
    @journeys << journey
  end  
 
end
