class RIImage
  attr_accessor :image, :x, :y, :width, :height
  def initialize(opts={})
    @path = opts[:image] || "/"
    @x = opts[:x] || 0
    @y = opts[:y] || 0
    @width = opts[:width]
    @height = opts[:height]
    @image = Image.new(path: @path, x: @x, y: @y, width: @width, height: @height)
  end
  def setSize(opts=[:width, :height])
    @width = opts[:width]
    @height = opts[:height]
  end
  def width; @width; end
  def height; @height; end
end
