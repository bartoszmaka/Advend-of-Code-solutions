class HouseDecoration
  def initialize
    @lights = Array.new(1000) { Array.new(1000, 0) }
    @line = ''
    @command = nil
    @left_upper_corner_x = nil
    @left_upper_corner_y = nil
    @right_bottom_corner_x = nil
    @right_bottom_corner_y = nil
  end

  def lit_lights_count
    @lights.flatten.count(1)
  end

  def execute(line)
    @line = line.strip
    parse
    rearrange_corners
    iterate_through_lights
  end

  private

  def iterate_through_lights
    @right_bottom_corner_y.upto(@left_upper_corner_y) do |y|
      @left_upper_corner_x.upto(@right_bottom_corner_x) do |x|
        send(@command, x, y)
      end
    end
  end

  def parse
    # gathers command and area from line
    # like "toggle 0,0 through 5,5" => :toggle, [0,0], [5,5]
    *@command, start, stop = @line.split(/ through | /)
    @command = @command.join('_').to_sym
    @left_upper_corner_x, @left_upper_corner_y = start.split(',').map(&:to_i)
    @right_bottom_corner_x, @right_bottom_corner_y = stop.split(',').map(&:to_i)
  end

  def rearrange_corners
    # makes you sure, that bottom corner is always under upper corner
    if @left_upper_corner_x > @right_bottom_corner_x
      @left_upper_corner_x, @right_bottom_corner_x = @right_bottom_corner_x, @left_upper_corner_x
    end
    if @left_upper_corner_y < @right_bottom_corner_y
      @left_upper_corner_y, @right_bottom_corner_y = @right_bottom_corner_y, @left_upper_corner_y
    end
  end

  def toggle(x, y)
    @lights[y][x] = (@lights[y][x]).zero? ? 1 : 0
  end

  def turn_on(x, y)
    @lights[y][x] = 1
  end

  def turn_off(x, y)
    @lights[y][x] = 0
  end
end

Lights = HouseDecoration.new
File.open(ARGV[0]).each_line { |line| Lights.execute(line) }
puts Lights.lit_lights_count
