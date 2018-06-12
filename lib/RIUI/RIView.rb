require 'ruby2d'
class RIView
  attr_accessor :width, :height, :background_color, :title
  def self.initialize(opts = {})
    @width = opts[:width] || 250
    @height = opts[:height] || 300
    @background_color = opts[:background_color] || 'white'
    @title = opts[:title] || "RIUI View"
  end
  def self.show
    extend Ruby2D::DSL
    set width: @width, height: @height, background: @background_color, title: @title
    show
  end
  def self.exit
    extend Ruby2D::DSL
    close
  end
end
