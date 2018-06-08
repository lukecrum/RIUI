class Actions
  @initialized = false

  def initialize
    @initialized = true
    actions
  end

  def holding; @holding; end
  def active; @active; end
  def initialized; @initialized; end
  
  private

  def actions
    extend Ruby2D::DSL
    @down_action = on :mouse_down do |e|
      if @square.contains?(e.x, e.y)
        @active = true
        @holding = true
      end
    end
    @up_action = on :mouse_up do |e|
      @holding = false
      @active = false
    end
  end
end
