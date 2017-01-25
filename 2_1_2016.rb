class PaperWrappers
  def initialize(path)
    @total_area = 0
    @list_of_dimensions = []
    parse_file(path)
  end

  def solve
    calculate
    @total_area
  end

  private

  def parse_file(path)
    File.open(path).each_line do |line|
      @list_of_dimensions.push(line.strip.split('x').map(&:to_i).sort())
    end
  end

  def calculate
    @list_of_dimensions.each do |dimensions|
      width, height, length = dimensions
      area = 2 * width * height + 2 * width * length + 2 * height * length
      slack = dimensions.min(2).inject(1, :*)
      @total_area += (area + slack)
    end
  end
end

Elves = PaperWrappers.new 'inputs/2input.txt'
puts Elves.solve
