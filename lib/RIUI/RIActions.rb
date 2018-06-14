class RIActions
  @initialized = false
  def initialize
    @initialized = true
    @objects = [0]
    actions
  end
  def add(object)
    if @objects[0] == 0
      @objects.pop
      @objects.push(object)
    else
      @objects.push(object)
    end
  end

  def holding; @holding; end
  def active; @active; end
  def initialized; @initialized; end
  def objects; @objects; end

  private

  def actions
    extend Ruby2D::DSL
    @down_action = on :mouse_down do |e|
      @objects.each do |object|
        object.mouse_down_actions(e.x, e.y)
      end
    end
    @up_action = on :mouse_up do |e|
      @objects.each do |object|
        object.mouse_up_actions
      end
    end
    @hover_action = on :mouse_move do |e|
      @objects.each do |object|
        object.mouse_move_actions(e.x, e.y)
      end
    end
    update do
      @objects.each do |object|
        object.update_actions
      end
    end
  end
end
