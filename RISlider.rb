require 'ruby2d'
class RISlider
  attr_accessor :length, :x, :y, :square_size, :ticks, :line_color, :square_color, :size, :font, :color

  @value = 0
  @active = false
  @holding = false

  def initialize(opts = [:length, :x, :y, :square_size, :ticks]) ### Initialize all variables and start functionality
    extend Ruby2D::DSL
    @x = opts[:x] || 0
    @y = opts[:y] || 0
    @length = opts[:length] || 100
    @square_size = opts[:square_size] || 10
    @ticks = opts[:ticks] || 10
    @label_font = opts[:label_font] || ''
    @label_size = opts[:label_size] || 20
    @label_color = opts[:label_color] || 'black'
    @line_color = opts[:line_color] || 'black'
    @square_color = opts[:square_color] || 'red'
    @line = Line.new(x1: @x, y1: @y, x2: @x + @length, y2: y, color: @line_color)
    @square = Square.new(size: @square_size, x: x, y: y - (@square_size/2), color: @square_color)
    actions
    start_update
  end

  def setColors(opts = [:square_color, :line_color]) ### Sets the colors of the line and square
    @line_color = opts[:line_color]
    @square_color = opts[:square_color]
    @line.color = @line_color
    @square.color = @square_color
  end

  def setLabel(opts = [:size, :font, :color]) ### Creates a label for the slider
    @label_size = opts[:size]
    @label_font = opts[:font]
    @label_color = opts[:color]
    @label = Text.new(x: @x + @length + 15, y: @y, color: @label_color, font: @label_font, size: @label_size)
  end
  def value; @value; end ### Returns slider's value

  private

  def actions ### Defines mouse click actions
    extend Ruby2D::DSL
    @down_action = on :mouse_down do |e|
      if @square.contains?(e.x, e.y)
         @active = true
         @holding = true
      end
    end
    @up_action = on :mouse_up do |e|
      @holding = false
      @active = false
    end
  end

  def check ### Checks and updates the square's position while keeping it in bounds of the line
    @max = @x + @length
    @min = @x - @square.size/2
    extend Ruby2D::DSL
    if @holding & @active
      mouse_x = get :mouse_x
      if mouse_x < @max && mouse_x > @min
        @square.x = get :mouse_x
      elsif mouse_x > @max
        @square.x = @max
      elsif @square.x < @min
        @square.x = @min
      end
    end
    @value = ((@square.x.to_f - @min.to_f) / @length.to_f) * @ticks
    @value = (@value).ceil - 1
  end

  def update_label ### Updates the slider's label when the value changes
    @label.text = @value
  end

  def start_update ### Starts update function to be run every frame
    extend Ruby2D::DSL
    update do
      check
      update_label
    end
  end
end
