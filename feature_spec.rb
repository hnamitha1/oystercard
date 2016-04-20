require './lib/journey'
require './lib/oystercard'
require './lib/station'
require './lib/journey_log'
#initialize
oystercard = Oystercard.new
journey_class = Journey.new

#scenario 1
log = JourneyLog.new(journey_class)
#journey_class = object_id, entry_station = nil, exit_station = nil
p journey_class
p journey_class.entry_station
p log
p log.start