require 'journeylog'

describe Journeylog do

	subject(:journeylog){described_class.new(:journey)}
	let(:journey) {double(:journey)}
	let(:journey_class) {double(:journey_class, new: journey )}

    context "when initialize" do
	    it "journey should be empty when we start" do
	    	expect(journeylog.journeys).to be_empty
	    end

	    it "creates a new journey" do
	    	expect(journeylog.journey_class).not_to be nil
	    end	
    end
    
    describe '#start' do
    	it "start a journey" do
    		expect(journey_class.to_recieve(:new) .to eq entry_station
    	end
    end
end



#start should start a new journey with an entry station
# a private method #current_journey should return an incomplete journey or create a new journey
 #finish should add an exit station to the current_journey
 #journeys should return a list of all previous journeys without exposing the internal array to external modification
 #remove redundant code from OysterCard class
