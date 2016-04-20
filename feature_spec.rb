require './lib/journey'
require './lib/oystercard'
require './lib/station'
require './lib/journey_log'
#initialize
oystercard = Oystercard.new
journey_class = Journey.new(:entry_station)
p journey_class.entry_station
p journey_class.exit(:exit_station)

#scenario 1
log = JourneyLog.new(journey_class)
#journey_class = object_id, entry_station = nil, exit_station = nil
p log.journey_class
p log.start
p log.current_journey
p log.journeys