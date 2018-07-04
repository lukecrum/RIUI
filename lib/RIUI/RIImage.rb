require 'ruby2d'
class RIImage

  attr_accessor :image, :x, :y, :width, :height, :color
  ##
  # image:: Path to the image to be displayed
  # x:: X position of the image
  # y:: Y position of the image
  # width:: Width of the image
  # height:: Height of the image
  # color:: Color tint of the image
  def initialize(opts={}) ### Creates a new RIImage object
    @path = opts[:image] || "/"
    @x = opts[:x] || 0
    @y = opts[:y] || 0
    @width = opts[:width] || 0
    @height = opts[:height] || 0
    @image = Image.new(path: @path, x: @x, y: @y, width: @width, height: @height)
  end
  def setSize(opts=[:width, :height]) ### Sets the width and height of the button
    @width = opts[:width]
    @height = opts[:height]
    @image.remove
    @image = Image.new(path: @path, x: @x-@width/2, y: @y-@height/2, width: @width, height: @height)
  end
  def setColor(opts=[:color]) ### Sets the color tint of the image
    @image.color = opts[:color]
  end
  #def width; @width; end ### Width of the image
  #def height; @height; end ### Height of the image
end
