require 'ruby2d'
class RISlider
  def initialize(line_length, square_size, x, y)
    extend Ruby2D::DSL
    set background: 'white'
    set title: 'UI Testing'
    square_x = x
    square_y = y
    @line = Line.new(x1: x, y1: y, x2: x + line_length, y2: y, color: 'black')
    @square = Square.new(size: square_size, x: square_x, y: square_y - (square_size/2), color: 'green')
    @active = false
    @holding = false
    @x = x
    @max = x + line_length
    @min = x
    @value = 0
    @down_action = on :mouse_down do |e|
      #check if on square
      #set square's x to mouse's x, only while held down
      if @square.contains?(e.x, e.y)
         @active = true
         @holding = true
         @x = e.x
      end
    end
    @up_action = on :mouse_up do |e|
      @holding = false
      @active = false
      @x = x
    end
    update do
      extend Ruby2D::DSL
      if @holding & @active
        mouse_x = get :mouse_x
        if mouse_x < @max && mouse_x > @min
          @square.x = get :mouse_x
        elsif mouse_x > @max
          @square.x = @max
        elsif @square.x < (@min - @square.size)
          @square.x = @min - @square.size
        end
      end
      @value = (@square.x - @min)/10 #10 ticks by default
      puts "Value: #{@value}"
      puts "Square x: #{@square.x}"
      puts "X: #{@x}"
    end
  end
end

line = RISlider.new(100, 10, 100, 100)
show
