require 'oystercard'

describe Oystercard do

  let(:station) {double :station}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station } 
# let(:card_balance) {double(:card, balance: Oystercard::BALANCE_LIMIT, entry_station: station)}
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  it "can top up the balance" do
    expect { subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it 'raises an error if top up amount exceeds 90' do
    maximum_balance = Oystercard::BALANCE_LIMIT
    subject.top_up(maximum_balance)
    expect { subject.top_up 1 }.to raise_error "balance should not exceed £#{maximum_balance}"
  end

  it {is_expected.to respond_to(:in_journey?)}

  it "in journey returns false" do
    expect(subject).not_to be_in_journey
  end

  it{is_expected.to respond_to(:touch_in).with(1).argument}

  it "journey starts with touch in" do
    subject.top_up 12
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it{is_expected.to respond_to(:touch_out).with(1).argument}

  it "journey ends with touch out" do
    subject.top_up 30
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject).not_to be_in_journey
  end

  it "raises an error when balance is less than 1" do
    expect {subject.touch_in(station) }.to raise_error "insufficient balance"
  end

  it 'should deduct minimum fare on touch out' do
    subject.top_up(Oystercard::BALANCE_LIMIT)
    expect {subject.touch_out station}.to change {subject.balance}.by -Oystercard::MINIMUM_FARE
  end

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


#    subject.top_up 30
#    subject.touch_in(:station1)
#    subject.touch_out(:station2)
#    expect(subject.journey.length).to eq 2
    #expect(subject.journey).to include("begin_journey"=>:station1,"end_journey"=>:station2)
  end
end
