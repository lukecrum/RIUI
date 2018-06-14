require_relative '../lib/RIUI/RILabel'
require 'rspec'
RSpec.describe RILabel do
  before :each do
    @label = RILabel.new(x: 300, y: 125, font: 'example/SF-PRO-Text-Bold.otf', size: 20, color: 'black', text: "Some Text")
    @label.setText(text: "New Text")
  end
  describe "#new" do
    it "creates a new RILabel object" do
      expect(@label).to be_an_instance_of RILabel
    end
  end
  describe "#setText" do
    it "changes the label's text" do
      expect(@label.text).to eql "New Text"
    end
  end
end
