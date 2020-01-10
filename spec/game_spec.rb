require 'game'

describe Game do
  let(:david) { double(:david, hitpoints: 100) }
  let(:goliath) { double(:goliath, hitpoints: 100) }
  let(:subject) { described_class.new(david, goliath) }
  
  describe '#attack' do 
    it 'reduces hitpoints' do 
      expect(goliath).to receive(:receive_damage).with(no_args)
      allow(david).to receive(:name).with(no_args)
      allow(goliath).to receive(:name).with(no_args)
      subject.attack
    end
  end

  describe "#intialize" do
    it "shows player 1" do
      expect(subject.player_1).to eq(david)
    end

    it "shows player 2" do
      expect(subject.player_2).to eq(goliath)
    end
  end
end