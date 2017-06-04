floor = 0
File.open('inputs/1input.txt').each_char do |char|
  case char
  when '('
    floor += 1
  when ')'
    floor -= 1
  end
end
puts floor
