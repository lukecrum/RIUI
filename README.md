# RIUI
A small, simple Ruby user interface framework

# Installation
# Usage

First include the gem in your Ruby file.
```rb
include 'RIUI'
```

**Buttons:**
To create a new button object:
```rb
button = RIButton.new(x: 125, y: 100, width: 150, height: 100, color: "green", hover_color: "blue")
```
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
 button.setOnClick(onClick: onclick)
 ```
