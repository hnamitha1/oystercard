require 'oystercard'

describe Oystercard do

  let(:station) {double :station}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station } 
# let(:card_balance) {double(:card, balance: Oystercard::BALANCE_LIMIT, entry_station: station)}
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  describe '#top_up' do
    
    it "can top up the balance" do
      expect { subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises an error if top up amount exceeds 90' do
      maximum_balance = Oystercard::BALANCE_LIMIT
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "balance should not exceed £#{maximum_balance}"
    end
  
  end 

  describe '#in_journey?' do 

    it {is_expected.to respond_to(:in_journey?)}

    it "in journey returns false" do
      expect(subject).not_to be_in_journey
    end
  
  end  

  describe '#touch_in' do 
    
    it{is_expected.to respond_to(:touch_in).with(1).argument}

    it "journey starts with touch in" do
      subject.top_up 12
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it "raises an error when balance is less than 1" do
      expect {subject.touch_in(station) }.to raise_error "insufficient balance"
    end
  
  end  

  describe '#touch_out' do

    it{is_expected.to respond_to(:touch_out).with(1).argument}

    it "journey ends with touch out" do
      subject.top_up 30
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject).not_to be_in_journey
    end

    it 'should deduct minimum fare on touch out' do
      subject.top_up(Oystercard::BALANCE_LIMIT)
      expect {subject.touch_out station}.to change {subject.balance}.by -Oystercard::MINIMUM_FARE
    end
  
  end  

  describe 'journeys' do

    it 'stores the entry station' do
      subject.top_up(80)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

    it "card has no journey" do
      expect(subject.journeys).to be_empty
    end

    it "stores journey" do
      subject.top_up 30
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end

  end

end
