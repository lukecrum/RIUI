require_relative 'RISlider.rb'
require_relative 'RIButton.rb'

button1 = RIButton.new(x: 100, y: 100, width: 100, height: 50, color: "green", hover_color: "blue")
button1.setLabel(text: "1", font: "SF-PRO-Text-Bold.otf", size: 25, color: "white")

button2 = RIButton.new(x: 250, y: 100, width: 100, height: 50, color: "purple", hover_color: "orange")
button2.setLabel(text: "2", font: "SF-PRO-Text-Bold.otf", size: 25, color: "white")

button3 = RIButton.new(x: 100, y: 200, width: 100, height: 50, color: "blue", hover_color: "green")
button3.setLabel(text: "3", font: "SF-PRO-Text-Bold.otf", size: 25, color: "white")

button4 = RIButton.new(x: 250, y: 200, width: 100, height: 50, color: "orange", hover_color: "purple")
button4.setLabel(text: "4", font: "SF-PRO-Text-Bold.otf", size: 25, color: "white")

slider = RISlider.new(length: 200, square_size: 10, x: 100, y: 300, ticks: 20)
slider.setColors(line_color: "black", square_color: "blue")
slider.setLabel(size: 20, font: 'SF-PRO-Text-Bold.otf', color: 'black')


extend Ruby2D::DSL
set background: 'white'
set title: 'RIUI Example'
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
