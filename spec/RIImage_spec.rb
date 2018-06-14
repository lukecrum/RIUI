require_relative '../lib/RIUI/RIImage'
require 'rspec'
RSpec.describe RIImage do
  before :each do
    @image = RIImage.new(x: 500, y: 275, image: 'example/tree.png', width: 100, height: 75)
    @image.setSize(width: 101, height: 76)
  end
  describe "#new" do
    it "creates a new RIImage object" do
      expect(@image).to be_an_instance_of RIImage
    end
  end
  describe "#setSize" do
    it "changes the size of the image" do
      expect(@image.width).to eql 101
      expect(@image.height).to eql 76
    end
  end
end
