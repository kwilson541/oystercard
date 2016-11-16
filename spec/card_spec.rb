require "card"

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:entry_station) { double(:entry_station) }

  it "should be initialized with a default balance of 0" do
    expect(oystercard.balance).to eq 0
  end

  describe "when using top_up" do
    it "increases the balance" do
      oystercard.top_up(5)
      expect(oystercard.balance).to eq 5
    end

    it "it raises error if trying to exceed maximum balance of £90" do
      oystercard.top_up(90)
      expect{oystercard.top_up(1)}.to raise_error "Can't exceed maximum balance of £90."
    end
  end

  describe "when using touch in" do
    it "should raise an error if balance amount is below minimum journey amount of £1" do
      expect{oystercard.touch_in(entry_station)}.to raise_error "Cannot touch in: minimum required balance is £1, please top up."
    end

    it { is_expected.to respond_to(:touch_in).with(1).argument }
  end

  describe "when using touch out" do
    it "should deduct the minimum journey ammount" do
      oystercard.top_up(2)
      expect{oystercard.touch_out}.to change{oystercard.balance}.by(-1)
    end

    it "resets entry station back to nil" do
      oystercard.top_up(2)
      oystercard.touch_in(entry_station)
      oystercard.touch_out
      expect(oystercard.entry_station).to eq nil
    end
  end

  describe "when asking if it's in journey" do
    it "it should be true if card has touched in" do
      oystercard.top_up(1)
      oystercard.touch_in(entry_station)
      expect(oystercard.in_journey?).to eq true
    end
    it "should be false if card has touched out" do
      oystercard.touch_out
      expect(oystercard.in_journey?).to be false
    end
  end





end
