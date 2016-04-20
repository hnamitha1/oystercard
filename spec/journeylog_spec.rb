require 'journey_log'

describe JourneyLog do

  subject(:journey_log) { described_class.new(journey_class) }
  let(:journey_class) { Journey.new(entry_station) }
  let(:entry_station) { double(:station, name:"Old Street",zone: 4) }
  let(:exit_station) { double(:station, name: "Bank", zone: 1) }

  describe '#start' do
    it "logs in the entry station" do
      expect(journey_log.start).to eq journey_class
    end 
  end

  describe '#finish' do
    it 'adds exit station to current_journey' do
      journey_class.exit(exit_station)
      expect(journey_log.current_journey).to eq journey_class
    end
  end

  describe '#journeys' do
    it 'returns a list of previous journeys' do
      expect(journey_log.journeys).to include journey_class
    end
  end

end