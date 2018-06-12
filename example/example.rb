require 'RIUI'

class Example < RIView
  @image = RIImage.new(x: 500, y: 275, image: "tree.png", width: 100, height: 75)
  puts 'ex 1'
  def self.onreset
    @image.setSize(width: @orig_w, height: @orig_h)
    @slider1.reset
    @slider2.reset
    puts "click"
  end
  def self.on_slider1_change
    @image.setSize(height: @slider1.value + @orig_h, width: @slider2.value + @orig_w)
    @label.setText(text: "Image width: #{@slider1.value + @orig_h}, Image height: #{@slider2.value + @orig_w}")
  end

  def self.on_slider2_change
    @image.setSize(height: @slider1.value + @orig_h, width: @slider2.value + @orig_w)
    @label.setText(text: "Image width: #{@slider1.value + @orig_h}, Image height: #{@slider2.value + @orig_w}")
  end

  def self.setRed
    @image.setColor(color: 'red')
    puts 'red'
  end
  def self.setGreen
    @image.setColor(color: 'green')
    puts 'green'
  end
  def self.setBlue
    @image.setColor(color: 'blue')
    puts 'blue'
  end
  def self.setYellow
    @image.setColor(color: 'yellow')
    puts 'yellow'
  end
  @actions = RIActions.new
  onclick = method(:onreset)
  @button1 = RIButton.new(x: 150, y: 350, width: 100, height: 50, color: "green", hover_color: "blue")
  @button1.onClick(onclick: onclick)
  @button1.setLabel(text: "Reset", font: "SF-PRO-Text-Bold.otf", size: 15, color: "white")

  @button2 = RIButton.new(x: 125, y: 100, width: 50, height: 50, color: 'red')
  red = method(:setRed)
  @button2.onClick(onclick: red)

  @button3 = RIButton.new(x: 200, y: 100, width: 50, height: 50, color: 'green')
  green = method(:setGreen)
  @button3.onClick(onclick: green)

  @button4 = RIButton.new(x: 125, y: 175, width: 50, height: 50, color: 'blue')
  blue = method(:setBlue)
  @button4.onClick(onclick: blue)

  @button5 = RIButton.new(x: 200, y: 175, width: 50, height: 50, color: 'yellow')
  yellow = method(:setYellow)
  @button5.onClick(onclick: yellow)

  @slider1 = RISlider.new(length: 200, square_size: 10, x: 100, y: 250, ticks: 200)
  @slider1.setColors(line_color: "black", square_color: "blue")
  @slider1.setLabel(size: 20, font: 'SF-PRO-Text-Bold.otf', color: 'black')
  slider1Change = method(:on_slider1_change)
  @slider1.onChange(onchange: slider1Change)

  @slider2 = RISlider.new(length: 200, square_size: 10, x: 100, y: 300, ticks: 200)
  @slider2.setColors(line_color: "black", square_color: "blue")
  @slider2.setLabel(size: 20, font: 'SF-PRO-Text-Bold.otf', color: 'black')
  slider2Change = method(:on_slider2_change)
  @slider2.onChange(onchange: slider2Change)

  @label = RILabel.new(x: 300, y: 125, font: 'SF-PRO-Text-Bold.otf', size: 20, color: 'black', text: "Image width: #{@image.width}, Image height: #{@image.height}")

  @actions.add(@slider1)
  @actions.add(@slider2)
  @actions.add(@button1)
  @actions.add(@button2)
  @actions.add(@button3)
  @actions.add(@button4)
  @actions.add(@button5)
  @actions.add(@label)
  @orig_h = @image.height
  @orig_w = @image.width

  self.initialize(width: 700, height: 450, background_color: 'white', title: 'RIUI')
  self.show
end
