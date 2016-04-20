require 'journey'

describe Journey do
  subject(:journey) { Journey.new }
  let(:entry_station) {double(:station, name:"oldStreet",zone: 4)}
  let(:exit_station) {double(:station, name:"bank", zone:3)}
  let(:journey_log) { double(:journey_log) }


  # describe '#start_journey' do

  #   it "logs in the entry station" do
  #      expect(journey.start_journey entry_station).to eq entry_station 
  #   end	

  # end

  describe '#finish_journey' do

  	it "logs in the exit station" do
  		expect(journey.finish_journey exit_station).to eq exit_station
  	end	

  end	

  it "checks journey is complete" do
      journey_log.start
      expect(journey.journey_complete?).to be false
  end	

  describe '#fare' do
  	context "when journey complete " do
  		it "charges minimum fare of £1" do
           allow(journey).to receive(:journey_complete?).and_return(true)
           expect(journey.fare).to eq 1
  		end	
  	end

  	context "when journey incomplete" do
  		it "charges penalty fare of £6" do
  			allow(journey).to receive(:journey_complete?).and_return(false)
  			expect(journey.fare).to eq 6
  		end	
  	end	
  end	
end
