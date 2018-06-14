require 'ruby2d'
class RILabel
  attr_accessor :x, :y, :font, :size, :color, :text
  ##
  # x:: X position of the label
  # y:: Y position of the label
  # font:: Path to font file for the label's text
  # size:: Size of the label's text
  # color:: Color of the label's text
  # text:: The text to be displayed
  def initialize(opts = {}) ### Creates a new RILabel object
    @x = opts[:x] || 0
    @y = opts[:y] || 0
    @font = opts[:font] || ''
    @size = opts[:size] || 20
    @color = opts[:color] || 'black'
    @text = opts[:text] || 'RIUI Label'
    @label = Text.new(x: @x, y: @y, font: @font, size: @size, color: @color, text: @text)
  end
  def setText(opts = [:text]) ### Sets the label's text
    @text = opts[:text]
    @label.remove
    @label = Text.new(x: @x, y: @y, font: @font, size: @size, color: @color, text: @text)
  end
  def update_actions; end
  def mouse_up_actions; end
  def mouse_down_actions(x, y); end
  def mouse_move_actions(x, y); end
  def text; @text; end ### The text to be displayed
end
