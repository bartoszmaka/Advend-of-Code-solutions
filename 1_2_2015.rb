class FloorsWalker
  def initialize(path)
    @floor = 0
    @way = unpack(path)
  end

  def solve
    @way.each do |char, index|
      walk(char)
      return index if in_basement?
    end
  end

private

  def unpack(path)
    File.open(path).read.chars.to_enum.with_index(1).to_a
  end

  def walk(char)
    case char
    when '(' then @floor += 1
    when ')' then @floor -= 1
    end
  end

  def in_basement?
    @floor == -1 ? true : false
  end

end

Santa = FloorsWalker.new('inputs/1input.txt')
puts Santa.solve

