#require 'journey'

class JourneyLog
  
  attr_reader :journeys

  def initialize(journey_class)
  	@journeys = []
  	@journey_class = journey_class
  end	

  def begin_journey(station)
    raise "Already in journey" if @current_journey
    @current_journey = journey_class.new
    add(@current_journey)
    @current_journey.start_journey(station)
  end

  def end_journey(station)
    #add(nil) unless @current_journey
    #dummy = @current_journey.finish_journey(station).dup
    #reset
    #dummy
    add(@current_journey = journey_class.new) unless @current_journey 
    @current_journey.finish_journey(station)
  end

  def journeys
    @journeys.dup
  end  

  private

  attr_reader :journey_class

  def add(journey)
    @journeys << journey
  end  

  def reset
    @current_journey = nil
  end
 
end
