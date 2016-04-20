require 'journey_log'

describe JourneyLog do

  let(:journey_class) { Journey.new }
  subject(:journey_log) { described_class.new(journey_class) }
  let(:entry_station) {double(:station, name:"Old Street",zone: 4) }

  describe '#start' do

    it "logs in the entry station" do
      expect(journey_log.start(journey_class.entry_station)).to eq entry_station 
    end 

  end

end