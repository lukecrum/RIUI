require_relative '../lib/RIUI/RIView'
require 'rspec'
RSpec.describe RIView do
  before :each do
    @view = RIView.new(width: 100, height: 100, background_color: 'white', title: 'RIUI Test View')
  end
  describe "#new" do
    it "creates a new RIView" do
      expect(@view).to be_an_instance_of RIView
    end
  end
end
