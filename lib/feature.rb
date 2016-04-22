require_relative 'journeylog'
require_relative 'journey'
require_relative 'oystercard'


log = JourneyLog.new(Journey)
card = Oystercard.new(log)
card.top_up 20
p card.touch_in("a")
p card.touch_out("b")

p log.journeys


log1 =JourneyLog.new(Journey)
card1 = Oystercard.new(log1)
#p card1.touch_in("c")   insufficient balance

#p card.top_up 90   should not exceed 90

p card1.touch_out("d") #without touch in


p card1.top_up 20
p card1.touch_in("a")
p card1.touch_in("a")
p  log1.journeys
