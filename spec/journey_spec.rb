require 'journey'

describe Journey do

  subject(:journey) { described_class.new(entry_station) }

  let(:entry_station) {double(:station, name:"Old Street",zone: 4)}
  let(:exit_station) {double(:station, name:"Bank", zone:3)}

  it "sets entry station" do
     expect(journey.entry_station).to eq entry_station
  end 

  it 'returns itself when exiting a journey' do
    expect(journey.exit(exit_station)).to eq journey
  end

  it "checks journey is complete" do
    journey.entry_station
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
