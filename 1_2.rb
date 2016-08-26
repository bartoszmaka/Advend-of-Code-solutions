class Floors_walker
  def initialize()
    @floor = 0
    # line below converts file to array of [char, index] pairs
    @way = File.open('inputs/1input.txt').read.chars.to_enum.with_index(1).to_a
  end

  def walk(char)
    case char
    when '('
      @floor += 1
    when ')'
      @floor -= 1
    end
  end

  def in_basement?
    @floor == -1 ? true : false
  end

  def solve
    @way.each do |char, index|
      walk(char)
      return index if in_basement?
    end
  end
end

Santa = Floors_walker.new
puts Santa.solve

