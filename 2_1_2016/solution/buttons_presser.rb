class ButtonsPresser
  attr_accessor :finger_position
  def initialize
    @buttons = (1..9).to_a
    @finger_position = 5
  end

  def up
    @finger_position -= 3 if can_move_up?
  end

  def down
    @finger_position += 3 if can_move_down?
  end

  def left
    @finger_position -= 1 if can_move_left?
  end

  def right
    @finger_position += 1 if can_move_right?
  end

  def formatted_finger_position
    y = (@finger_position / 3) + 1
    x = (@finger_position - y * 3)
    "#{x}. #{y} => #{@finger_position}"
  end

  private

  def can_move_up?
    @finger_position > 3
  end

  def can_move_down?
    @finger_position <= 6
  end

  def can_move_left?
    (@finger_position % 3) != 1
  end

  def can_move_right?
    (@finger_position % 3) != 0
  end
end
