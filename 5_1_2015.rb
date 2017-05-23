class StringsChecker
  attr_reader :nice_strings

  def initialize
    @string = ''
    @nice_strings ||= 0
  end

  def check_string string
    @string = string
    @nice_strings += 1 if (has_two_identical_chars_in_row? &&
                           has_three_or_more_vovels? &&
                           has_no_bad_strings?)
  end

  private

  def has_three_or_more_vovels?
    @string.chars.count { |c| c.match(/[aeoiu]/) } >= 3 ? true : false
  end

  def has_two_identical_chars_in_row?
    @string.chars.each_cons(2) do |two_chars|
      return true if two_chars.first == two_chars.last
    end
  end

  def has_no_bad_strings?
    @string.match(/ab|cd|pq|xy/) ? false : true
  end
end

Santa = StringsChecker.new

if ARGV.empty? then puts "usage: ruby 5_1.rb input.txt"; exit end

File.open(ARGV[0]).each_line do |line|
  Santa.check_string line
end

puts Santa.nice_strings
