require 'journey'
require 'journeylog'

describe JourneyLog do
 
   subject(:journey_log) { described_class.new(Journey) }
   let(:entry_station) { double(:station, name: "A", zone: 1) }
   let(:exit_station) {double(:station, name: "B", zone: 2)}

   describe '#initialize' do
   	it "empty list of journeys" do
   		expect(journey_log.journeys).to be_empty
   	end
   end

   describe '#begin_journey' do
   	it "returns entry_station"	do
   		expect(journey_log.begin_journey(entry_station)).to eq  entry_station
   	end
   end

   describe '#end_journey' do
   	before do
   	  journey_log.begin_journey(entry_station)	
   	end

   	it "returns exit station" do
   		journey = journey_log.end_journey(exit_station)
   		expect(journey_log.journeys).to include journey  
   	end
   end 
   
   describe '#journeys' do 
   	before do
   		3.times {
   			journey_log.begin_journey(entry_station)
   			journey_log.end_journey(exit_station)
   		}
   	end
   	
   	it "list of journeys" do
   		expect(journey_log.journeys).to be_a(Array)
   		expect(journey_log.journeys.size).to eq 3
   	end


 end
end

