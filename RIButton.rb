require 'ruby2d'

class RIButton
  attr_accessor :x, :y, :width, :height, :color, :hover_color, :text, :font, :size, :font_color
  ##
  #x:: X position of the button
  #y:: Y position of the button
  #width:: Width of the button
  #height:: Height of the button
  #color:: Base color of the button
  #hover_color:: Color the button will change to when the mouse is hovered over it. Exclude this to have no hover color
  #text:: Text to show on the button's label
  #font:: Font of the button's label (note: as of now, you must include the font file within your project for this to work)
  #size:: Size of the button's label's text
  #font_color:: Color of the button's label's text
  ##
  def initialize(opts = [:x, :y, :width, :height, :color, :hover_color]) ### Initialize variables and start actions
    @x = opts[:x] || 0
    @y = opts[:y] || 0
    @width = opts[:width] || 100
    @height = opts[:height] || 50
    @color = opts[:color] || 'blue'
    @hover_color = opts[:hover_color] || 'green'
    @rect = Rectangle.new(x: @x, y: @y, z: 0, width: @width, height: @height, color: @color)
    actions
  end

  def contains(x, y) ### Check if the button contains a certain point
    if @rect.contains?(x, y)
      true
    else
      false
    end
  end

  def setLabel(opts = [:text, :font, :size, :color]) ### Sets the label of the button
    @text = opts[:text]
    @font = opts[:font]
    @size = opts[:size]
    @font_color = opts[:font_color]
    @temp_label = Text.new(x: 0, y: 0, text: @text, font: @font, color: @font_color, size: @size)
    @label = Text.new(x: @rect.x + (@rect.width / 2) - (@temp_label.width/2), y: @rect.y + (@rect.height / 2) - (@temp_label.height/2), text: @text, font: @font, color: @font_color, size: @size)
    @temp_label.remove
  end

  private

  def actions ### Defines actions
    extend Ruby2D::DSL
    @hover_event = on :mouse_move do |e|
      if @rect.contains?(e.x, e.y)
        @rect.color = @hover_color
      else
        @rect.color = @color
      end
    end
  end

end
