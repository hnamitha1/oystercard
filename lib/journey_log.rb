require_relative 'journey'

class JourneyLog

  attr_reader :journey_class, :journeys

  def initialize(journey_class)
    @journey_class = journey_class
  end

  def start 
    journey_class
  end

  def current_journey
    journey_class
  end

  def journeys
    @journeys = []
    @journeys << journey_class
  end

end