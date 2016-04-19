require 'oystercard'

describe Oystercard do

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

  it{is_expected.to respond_to(:touch_in)}

  it "journey starts with touch in" do
    subject.top_up 12
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it{is_expected.to respond_to(:touch_out)}

  it "journey ends with touch out" do
    subject.top_up 30
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "raises an error when balance is less than 1" do
    expect {subject.touch_in }.to raise_error "insufficient balance"
  end

  it 'should deduct minimum fare on touch out' do
    subject.top_up(Oystercard::BALANCE_LIMIT)
    expect {subject.touch_out}.to change {subject.balance}.by -Oystercard::MINIMUM_FARE
  end
end
