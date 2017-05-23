require './solution/solution'
# require 'solution'

foo = InputReader.new
foo.read_from_file('input.txt')
puts "code: #{foo.code}"
