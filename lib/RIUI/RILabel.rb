class RILabel
  attr_accessor :x, :y, :font, :size, :color, :text
  def initialize(opts = {})
    @x = opts[:x] || 0
    @y = opts[:y] || 0
    @font = opts[:font] || ''
    @size = opts[:size] || 20
    @color = opts[:color] || 'black'
    @text = opts[:text] || 'RIUI Label'
    @label = Text.new(x: @x, y: @y, font: @font, size: @size, color: @color, text: @text)
  end
  def setText(opts = [:text])
    @text = opts[:text]
    @label.remove
    @label = Text.new(x: @x, y: @y, font: @font, size: @size, color: @color, text: @text)
  end
  def update_actions; end
  def mouse_up_actions; end
  def mouse_down_actions(x, y); end
  def mouse_move_actions(x, y); end
end
