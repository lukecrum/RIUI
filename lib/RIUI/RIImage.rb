require 'ruby2d'
class RIImage

  attr_accessor :image, :x, :y, :width, :height, :color

  def initialize(opts={})
    @path = opts[:image] || "/"
    @x = opts[:x] || 0
    @y = opts[:y] || 0
    @width = opts[:width] || 0
    @height = opts[:height] || 0
    @image = Image.new(path: @path, x: @x, y: @y, width: @width, height: @height)
  end
  def setSize(opts=[:width, :height])
    @width = opts[:width]
    @height = opts[:height]
    @image.remove
    @image = Image.new(path: @path, x: @x-@width/2, y: @y-@height/2, width: @width, height: @height)
  end
  def setColor(opts=[:color])
    @image.color = opts[:color]
  end
  def width; @width; end
  def height; @height; end
end
