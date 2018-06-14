require 'ruby2d'
class RISlider
  attr_accessor :length, :x, :y, :square_size, :ticks, :line_color, :square_color, :size, :font, :color, :active, :square, :onchange
  ##
  # length:: Length of the slider
  # x:: X position of the slider
  # y:: Y position of the slider
  # square_size:: Length/width of the square
  # ticks:: Number that represents the value when the square is at its maximum position
  # line_color:: Color of the line
  # square_color:: Color of the square
  # size:: Size of the label's text
  # font:: Path to the font for the label's text
  # color:: Color of the label's text
  # active:: Checks whether the slider is active
  # onchange:: Action to be called when the slider's value changess
  ##
  def initialize(opts = [:length, :x, :y, :square_size, :ticks, :actions]) ### Creates a new RISlider object
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
    @actions = opts[:actions]
    @value = 0
    @line = Line.new(x1: @x, y1: @y, x2: @x + @length, y2: y, color: @line_color)
    self.square = Square.new(size: @square_size, x: x - (@square_size/2), y: y - (@square_size/2), color: @square_color)
    setState(active: false)
  end

  def setColors(opts = [:square_color, :line_color]) ### Sets the colors of the line and square
    @line_color = opts[:line_color]
    @square_color = opts[:square_color]
    @line.color = @line_color
    self.square.color = @square_color
  end

  def setLabel(opts = [:size, :font, :color]) ### Creates a label for the slider
    @label_size = opts[:size]
    @label_font = opts[:font]
    @label_color = opts[:color]
    @label = Text.new(x: @x + @length + 15, y: @y, color: @label_color, font: @label_font, size: @label_size, text: '0')
  end
  def reset ### Reset's value to 0 and square's position to the beginning
    self.square.x = @x - (@square_size/2)
    @value = 0
  end
  def onChange(opts = [:onchange]) ### Sets the action to be called when the slider's value changes
    @onChange = opts[:onchange]
  end
  def value; @value; end ### Returns slider's value
  def active; @active; end
  def mouse_down_actions(x, y)
    if self.square.contains?(x, y)
       setState(active: true)
    end
  end
  def mouse_up_actions
    setState(active: false)
  end
  def mouse_move_actions(x, y); end
  def update_actions
    check
    update_label
    changed = check_for_change(@old_value, @value)
    if changed
      @onChange.call
    end
  end
  def label; @label; end ### Objects of the slider's label
  def line_color; @line_color; end ### Color of the line
  def square_color; @square_color; end ### Color of the square
  private

  def setState(opts=[:active])
    self.active = opts[:active]
  end

  def check ### Checks and updates the square's position while keeping it in bounds of the line
    @max = @x + @length
    @min = @x - self.square.size/2
    @old_value = @value
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
    if @value > @ticks; @value = ticks; end
  end

  def check_for_change(old_value, new_value)
    if old_value == new_value
      false
    else
      true
    end
  end

  def update_label ### Updates the slider's label when the value changes
    @label.text = @value
  end

end
