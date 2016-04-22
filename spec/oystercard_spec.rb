require 'oystercard'
require 'journeylog'
require 'journey'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  describe '#initialize' do
    it "has a balance equals to 0" do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it "adds top up the balance" do
      expect { oystercard.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises an error if top up amount exceeds 90' do
      oystercard.top_up described_class::BALANCE_LIMIT
      expect {oystercard.top_up 1 }.to raise_error "balance should not exceed £#{described_class::BALANCE_LIMIT}"
    end
  end

  describe '#touch_in' do
    it{is_expected.to respond_to(:touch_in).with(1).argument}

    it "stores the entry station" do
      oystercard.top_up 1
      expect(oystercard.touch_in(entry_station)).to eq entry_station
    end

    it "raises an error when balance is less than 1" do
      allow(oystercard).to receive(:balance).and_return 0
      expect {oystercard.touch_in(entry_station) }.to raise_error "insufficient balance"
    end
  end

  describe '#touch_out' do
    before do
      oystercard.top_up 1
      oystercard.touch_in(entry_station)
    end

    it{is_expected.to respond_to(:touch_out).with(1).argument}

    it "reduces the balance by minimum fare" do
      expect { oystercard.touch_out(exit_station) }.to change{ oystercard.balance }.by -(Journey::MINIMUM_FARE)
    end

  end

end
