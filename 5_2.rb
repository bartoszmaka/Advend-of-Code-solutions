class StringsChecker
  attr_reader :nice_strings

  def initialize
    @string = ''
    @nice_strings ||= 0
  end

  def check_string string
    @string = string
    @nice_strings += 1 if has_two_pairs_of_letters? && has_surrounded_char?
  end

  private

  def has_two_pairs_of_letters?
    @string.chars.each_cons(2) do |two_chars|
      return true if @string.scan(two_chars.join('')).count >= 2
    end
  end

  def has_surrounded_char?
    @string.chars.each_cons(3) do |three_chars|
      return true if three_chars.first == three_chars.last
    end
  end
end

Santa = StringsChecker.new

if ARGV.empty? then puts "usage: ruby 5_2.rb input.txt"; exit end

File.open(ARGV[0]).each_line do |line|
  Santa.check_string line
end

puts Santa.nice_strings
