require 'ruby2d'
class RISlider
  attr_accessor :length, :x, :y, :square_size, :ticks, :line_color, :square_color, :size, :font, :color, :square, :id, :active

  @value = 0

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
    puts 'variables initialized'
    @line = Line.new(x1: @x, y1: @y, x2: @x + @length, y2: y, color: @line_color)
    self.square = Square.new(size: @square_size, x: x, y: y - (@square_size/2), color: @square_color)
    puts 'shapes drawn'
    setState(active: false)
    actions
    puts 'actions started'
  #  start_update
    puts 'update started'
  end

  def setColors(opts = [:square_color, :line_color]) ### Sets the colors of the line and square
    @line_color = opts[:line_color]
    @square_color = opts[:square_color]
    @line.color = @line_color
    self.square.color = @square_color
    puts 'colors set'
  end

  def setLabel(opts = [:size, :font, :color]) ### Creates a label for the slider
    @label_size = opts[:size]
    @label_font = opts[:font]
    @label_color = opts[:color]
    @label = Text.new(x: @x + @length + 15, y: @y, color: @label_color, font: @label_font, size: @label_size, text: '0')
    puts 'label set'
  end
  def value; @value; end ### Returns slider's value

  def mouse_actions
    if self.square.contains?(e.x, e.y)
       setState(active: true)
       puts 'mouse down'
    end
  end
  def update_actions
    check
    update_label
  end
  private

  def setState(opts=[:active])
    self.active = opts[:active]
  end
  def actions ### Defines mouse click actions
    extend Ruby2D::DSL
    @down_action = on :mouse_down do |e|
      if self.square.contains?(e.x, e.y)
         setState(active: true)
         puts 'mouse down'
      end
    end
    @up_action = on :mouse_up do |e|
      setState(active: false)
      puts 'mouse up'
    end
  end

  def check ### Checks and updates the square's position while keeping it in bounds of the line
    @max = @x + @length
    @min = @x - self.square.size/2
    extend Ruby2D::DSL
    if self.active
      puts 'active'
      mouse_x = get :mouse_x
      if mouse_x < @max && mouse_x > @min
        self.square.x = mouse_x
        puts 'moved square'
      elsif mouse_x > @max
        self.square.x = @max
      elsif mouse_x < @min
        self.square.x = @min
      end
    end
    @value = ((self.square.x.to_f - @min.to_f) / @length.to_f) * @ticks
    @value = (@value).ceil - 1
    if @value < 0; @value = 0; end
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
