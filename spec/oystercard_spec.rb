require 'oystercard'

describe Oystercard do
 it 'has a variable balance' do
  expect(subject.balance).to eq (0)
 end

 it "it is in_journey" do
   expect(subject.in_journey?).to eq (false)
 end

 it 'can top up' do
   expect(subject.top_up(20)).to eq (20)
 end

 it 'prevents top up and cannot exceed £90' do
   expect{ subject.top_up(100) }.to raise_error("Exceeds top up limit: #{Oystercard::LIMIT}")
 end

 it 'decuts money from card' do
   subject.top_up 90
   expect(subject.deduct(50)).to eq (40)
 end

it 'touches in' do
  subject.in_use = true
  expect(subject.in_journey?).to eq(true)
end

it 'touches out' do
  subject.in_use = false
  expect(subject.in_journey?).to eq (false)
end
end
