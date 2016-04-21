class Journeylog
  
  attr_reader :journeys,:journey_class

  def initialize(journey_class)
  	@journeys = []
  	@journey_class = journey_class
  end	
 
end
