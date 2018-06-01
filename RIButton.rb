require 'ruby2d'

class RIButton
  @@clicked = false
  def initialize(x, y, width, height, color, hover)
    extend Ruby2D::DSL
    set background: 'white'
    set width: 450
    set title: 'UI Testing'
    @rect = Rectangle.new(x: x, y: y, z: 0, width: width, height: height, color: color)
    @hover_color = hover
    @normal_color = color
    @click_event = on :mouse_down do |e|
      if @rect.contains?(e.x, e.y)
        @clicked = true
      else
        @clicked = false
      end
      isClicked
    end
    @hover_event = on :mouse_move do |e|
    if @rect.contains?(e.x, e.y)
      @rect.color = @hover_color
    else
      @rect.color = @normal_color
    end
  end
  def isClicked
    if @clicked
      true
    else
      false
    end
  end
  def contains(x, y)
    if @rect.contains?(x, y)
      true
    else
      false
    end
  end
  def setLabel(text, font, fontSize, fontColor)
    @temp_label = Text.new(x: 0, y: 0, text: text, font: font, color: 'white', size: fontSize)
    @label = Text.new(x: @rect.x + (@rect.width / 2) - (@temp_label.width/2), y: @rect.y + (@rect.height / 2) - (@temp_label.height/2), text: text, font: font, color: fontColor, size: fontSize)
    @temp_label.remove
  end
end
end


button1 = RIButton.new(100, 100, 100, 50, "green", "blue")
button1.setLabel("1", "SF-PRO-Text-Bold.otf", 25, "white")
button2 = RIButton.new(250, 100, 100, 50, "purple", "orange")
button2.setLabel("2", "SF-PRO-Text-Bold.otf", 25, "white")
button3 = RIButton.new(100, 200, 100, 50, "blue", "green")
button3.setLabel("3", "SF-PRO-Text-Bold.otf", 25, "white")
button4 = RIButton.new(250, 200, 100, 50, "orange", "purple")
button4.setLabel("4", "SF-PRO-Text-Bold.otf", 25, "white")

extend Ruby2D::DSL
on :mouse_down do |e|
  if button1.contains(e.x, e.y)
    puts 'click 1'
  end
  if button2.contains(e.x, e.y)
    puts 'click 2'
  end
  if button3.contains(e.x, e.y)
    puts 'click 3'
  end
  if button4.contains(e.x, e.y)
    puts 'click 4'
  end
end

show
