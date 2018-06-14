require_relative '../lib/RIUI/RISlider'
require 'rspec'
RSpec.describe RISlider do
  before :each do
    @slider = RISlider.new(length: 200, square_size: 10, x: 100, y: 300, ticks: 200)
    @slider.setLabel(size: 20, font: 'example/SF-PRO-Text-Bold.otf', color: 'black')
    @slider.setColors(square_color: 'red', line_color: 'black')
  end
  describe "#new" do
    it "creates a new RISlider object" do
      expect(@slider).to be_an_instance_of RISlider
      expect(@slider.value).to eql 0
    end
  end
  describe "#setLabel" do
    it "adds a label" do
      expect(@slider.label).to be_an_instance_of Text
    end
  end
  describe "#setColors" do
    it "sets the colors of the line and square" do
      expect(@slider.line_color).to eql 'black'
      expect(@slider.square_color).to eql 'red'
    end
  end
 end
