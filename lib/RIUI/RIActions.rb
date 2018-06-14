class RIActions
  def initialize ### Create a new RIActions object
    @objects = [0]
    actions
  end
  def add(object) ### Adds an object to the actions
    if @objects[0] == 0
      @objects.pop
      @objects.push(object)
    else
      @objects.push(object)
    end
  end

  def objects; @objects; end ### Returns the array of objects that were added

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
