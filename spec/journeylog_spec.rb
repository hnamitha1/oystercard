require 'journeylog'
require 'journey'

describe Journeylog do

	subject(:journeylog){described_class.new}
	let(:journey) {Journey.new}
	#let(:journey) {double(:journey, start_journey: entry_station, finish_journey: exit_station)}
	#let(:journey_class) {double(:journey_class, new: journey )}
	let(:entry_station){double(:entry_station)}
	let(:exit_station) {double(:exit_station)}
    
    context "when initialize" do
	    it "journey should be empty when we start" do
	    	expect(journeylog.journeys).to be_empty
	    end

	    it "creates a new journey" do
	    	expect(journeylog.journey).not_to be nil
	    end	
    end

    context "history updates" do
    	it "get the entry station when journey starts" do
    		journeylog.journey.start_journey(entry_station)
    		journeylog.journey.finish_journey(exit_station)
    		journeylog.journeylogs
    		expect(journeylog.journeys.last).to eq({entry_station: entry_station,exit_station: exit_station})
    	end
    end
       
end



#start should start a new journey with an entry station
# a private method #current_journey should return an incomplete journey or create a new journey
 #finish should add an exit station to the current_journey
 #journeys should return a list of all previous journeys without exposing the internal array to external modification
 #remove redundant code from OysterCard class
>>>>>>> day-four
