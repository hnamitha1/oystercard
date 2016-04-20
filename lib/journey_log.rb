require_relative 'journey'

class JourneyLog

  def initialize(journey_class = Journey.new)
    # @journey_class = journey_class
  end

  def start(entry_station)  #journey_class.entry_station
    Journey.new.entry_station = journey_class.entry_station
  end

end