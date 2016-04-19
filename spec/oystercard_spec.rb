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

  it {is_expected.to respond_to(:deduct).with(1).argument} 

  it "can reduce the balance" do
    expect {subject.deduct 3 }.to change{subject.balance }.by -3
  end 
    
end
