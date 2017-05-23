class Walker
  attr_accessor :x, :y, :dir
  def initialize
    @x = 0
    @y = 0
    @dir = :north
    @dirs = [:north, :east, :south, :west]
  end

  def analyze
    steps = File.read('inputs/1_2017.txt').split(', ')
    steps.each do |step|
      step[0] == 'R' ? turn_clockwise : turn_anticlockwise
      push(step[1..-1].to_i)
    end
  end

  def shortest_path_length
    @x.abs + @y.abs
  end

  private

  def turn_clockwise
    @dir = @dirs.at((@dirs.index(@dir) + 1) % 4)
  end

  def turn_anticlockwise
    @dir = @dirs.at((@dirs.index(@dir) + 3) % 4)
  end

  def push(n)
    case @dir
    when :north then @y += n
    when :east then @x += n
    when :south then @y -= n
    when :west then @x -= n
    end
  end
end

w = Walker.new
w.analyze
puts w.shortest_path_length
