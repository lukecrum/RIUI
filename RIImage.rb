class RIImage
  attr_accessor :image, :x, :y
  def initialize(opts={})
    @path = opts[:image] || "/"
    @x = opts[:x] || 0
    @y = opts[:y] || 0
    @width = opts[:width]
    @height = opts[:height]
    @image = Image.new(path: @path, x: @x, y: @y)
  end
end
