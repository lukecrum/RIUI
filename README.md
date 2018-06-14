[![Gem Version](https://badge.fury.io/rb/RIUI.svg)](https://badge.fury.io/rb/RIUI) [![BuildStatus](https://travis-ci.org/lukecrum/RIUI.svg?branch=master)](https://travis-ci.org/lukecrum/RIUI)
# RIUI

A small, simple Ruby user interface framework

**NOTE:** *This project is its very early stages of development. If you experience a bug or have an idea for a new feature, don't hesitate to open an issue*

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'RIUI'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install RIUI

# Usage

First include the gem in your Ruby file.
```rb
require 'RIUI'
```
**Views:**

To create a new view:
```rb
require 'RIUI'
class my_class < RIView
end
```
Then, initialize it:
```rb
self.initialize(width: 700, height: 450, background_color: 'white', title: 'RIUI')
```
Next, show it:
```rb
self.show
```
To close the view:
```rb
self.exit
```

**Actions:**

When you create a new view, you must also create a new instace of `RIActions`. This is necessary to provide functionality to UI elements.
```rb
actions = RIActions.new
```
You must then add each element to the action class:
```rb
button = RIButton.new(....)
slider = RISlider.new(....)
actions.add(button)
actions.add(slider)
```

**Buttons:**

To create a new button object:
```rb
button = RIButton.new(x: 125, y: 100, width: 150, height: 100, color: "green", hover_color: "blue")
```

See docs for descriptions of each arrtibute

To add clicking functionality, first create the method you would like to trigger:
```rb
def click
  puts 'button clicked'
end
 ```
 Then, create an object with that method:
 ```rb
 onclick = method(:click)
 ```
 Alternatively, you can call a method from a class:
 ```rb
 my_class = MyClass.new
 onclick = my_class.method(:method_name)
 ```
 Next, assign the method to the button:
 ```rb
 button.onClick(onclick: onclick)
 ```

 **Sliders:**

 To create a new slider object:
 ```rb
 slider = RISlider.new(length: 200, square_size: 10, x: 100, y: 250, ticks: 20)
 ```

 See docs for descriptions of each attribute

 To access the slider's value:
 ```rb
 slider.value #returns the current value of the slider
 ```
 To reset the slider to 0 and reset the position of the square:
 ```rb
 slider.reset
 ```
 To add call a method when the slider's value changes:
 ```rb
 def slider_change
  puts "#{slider.value}
 end
 value_changed = method(:slider_change)
 slider.onChange(onchange: value_changed)
 ```

 **Images:**
 To create an image object:
 ```rb
 image = RIImage.new(x: 500, y: 275, image: "tree.png", width: 100, height: 75)
 ```
 You can change the color of an image:
 ```rb
 image.setColor(color: 'red')
 ```

 **Labels:**
 **Note:** *At this time, you must include font files as a file in your project.*
 ```rb
 label = RILabel.new(x: 300, y: 125, font: 'SF-PRO-Text-Bold.otf', size: 20, color: 'black', text: 'Hello World!')
 ```
 To change the label's text:
 ```rb
 label.setText(text: 'Some new text')
 ```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/RIUI.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
