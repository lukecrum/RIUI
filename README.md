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
include 'RIUI'
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
 
 **Sliders::**
 
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
 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/RIUI.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
