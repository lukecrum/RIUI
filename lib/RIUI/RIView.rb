require 'ruby2d'
class RIView
  attr_accessor :width, :height, :background_color, :title
  ##
  # width:: width of the view
  # height:: height of the view
  # background_color:: background color of the view
  # title:: title on the view
  ##
  def initialize(opts = {}) ### Creates a new RIView object
    @width = opts[:width] || 250
    @height = opts[:height] || 300
    @background_color = opts[:background_color] || 'white'
    @title = opts[:title] || "RIUI View"
  end
  def self.initialize(opts = {}) ### Initialize self when making a subclass
    @width = opts[:width] || 250
    @height = opts[:height] || 300
    @background_color = opts[:background_color] || 'white'
    @title = opts[:title] || "RIUI View"
  end
  def self.show ### Shows the view
    extend Ruby2D::DSL
    set width: @width, height: @height, background: @background_color, title: @title
    show
  end
  def self.exit ### Closes the view
    extend Ruby2D::DSL
    close
  end
end
