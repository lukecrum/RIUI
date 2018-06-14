require_relative '../lib/RIUI/RIButton'
require_relative '../lib/RIUI/RIActions'
require 'rspec'
RSpec.describe RIActions do
  before :each do
    @actions = RIActions.new
    @button = RIButton.new(x: 150, y: 350, width: 100, height: 50, color: "green", hover_color: "blue")
    @actions.add(@button)
  end
  describe '#new' do
    it 'creates a new instance of RIActions' do
      expect(@actions).to be_an_instance_of RIActions
    end
  end
  describe '#add' do
    it 'adds an object to the objects array' do
      expect(@actions.objects).not_to eql nil
    end
  end
end
