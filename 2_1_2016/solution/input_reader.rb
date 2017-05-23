class InputReader
  attr_accessor :code
  def initialize
    @buttons = ButtonsPresser.new
    @code = ''
  end

  def read_from_file(path)
    File.read(path).each_line do |line|
      execute(line)
    end
  end

  def execute(instructions_string)
    instructions_string.chars do |c|
      call_proper_instruction(c)
    end
    @code.concat(@buttons.finger_position.to_s)
  end

  private

  def call_proper_instruction(character)
    case character
    when 'U' then @buttons.up
    when 'D' then @buttons.down
    when 'L' then @buttons.left
    when 'R' then @buttons.right
    end
  end
end
