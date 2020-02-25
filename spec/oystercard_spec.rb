require 'oystercard'

describe Oystercard do
 it 'has a variable balance' do
  expect(subject.balance).to eq (0)
 end

 it "tells us if it is in_journey" do
   # expect(subject).not_to be_in_journey
   expect(subject.in_journey?).to eq (false)
 end

 it 'can top up' do
   expect(subject.top_up(20)).to eq (20)
 end

 it 'prevents top up and cannot exceed £90' do
   expect{ subject.top_up(100) }.to raise_error("Exceeds top up limit: #{Oystercard::LIMIT}")
 end

 # it 'deducts money from card' do
 #   subject.top_up 90
 #   expect(subject.deduct(50)).to eq (40)
 # end

  it 'touches out' do
    expect(subject.touch_out).to eq (false)
  end

  it "deducts £4 when touches out" do
    expect{ subject.touch_out }.to change{subject.balance }.by (-4)
  end

  describe "touch_in" do

    it 'raise_error if balance is under £1 when i touch in' do
      expect{ subject.touch_in }.to raise_error "Not enough money"
    end

    it "touches in" do
      expect(subject).to respond_to(:touch_in)
    end

    it 'is in a journey if i touch in' do
      subject.top_up(10)
      subject.touch_in
      expect(subject.in_journey?).to eq(true)
    end
  end
end
