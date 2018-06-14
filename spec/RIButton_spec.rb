require_relative '../lib/RIUI/RIButton'
require 'rspec'
RSpec.describe RIButton do
  before :each do
    @button = RIButton.new(x: 150, y: 350, width: 100, height: 50, color: "green", hover_color: "blue")
    @button.setLabel(text: "Text", font: "example/SF-PRO-Text-Bold.otf", size: 15, color: "white")
  end
  describe "#new" do
    it 'creates a new RIButton object' do
      expect(@button).to be_an_instance_of RIButton
    end
  end
  describe '#setLabel' do
    it 'adds a label to the button' do
      expect(@button.label).to be_an_instance_of Text
    end
  end
end
