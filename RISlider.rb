require 'ruby2d'
class RISlider
  def initialize(line_length, square_size, x, y)
    extend Ruby2D::DSL
    set background: 'white'
    set title: 'UI Testing'
    @line = Line.new(x1: x, y1: y, x2: x + line_length, y2: y, color: 'black')
    @square = Square.new(size: square_size, x: x , y: y - (square_size/2), color: 'green')
    @active = false
    @holding = false
    @x = x
    @orig_x = x
    @max = x + line_length
    @down_action = on :mouse_down do |e|
      #check if on square
      #set square's x to mouse's x, only while held down
      @holding = true
      if @square.contains?(e.x, e.y)
         @active = true
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
        unless mouse_x > @max
          @square.x = get :mouse_x
        else
          @square.x = @max
        end
        if @square.x < (@x - @square.size)
          @square.x = @x - @square.size
        end
      end
    end
  end
end

line = RISlider.new(100, 10, 100, 100)
show
