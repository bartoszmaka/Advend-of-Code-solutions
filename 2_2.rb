class RibbonWrappers
  def initialize(path)
    @total_length = 0
    @list_of_dimensions = []
    parse_file(path)
  end

  def solve
    calculate
    @total_length
  end

  private

  def parse_file(path)
    File.open(path).each_line do |line|
      @list_of_dimensions.push(line.strip.split('x').map(&:to_i).sort())
    end
  end

  def calculate
    @list_of_dimensions.each do |dimensions|
      length = dimensions.min(2).inject(0) { |sum, n| sum + 2 * n }
      bow = dimensions.inject(1, :*)
      @total_length += (length + bow)
    end
  end
end

Elves = RibbonWrappers.new 'inputs/2input.txt'
puts Elves.solve
