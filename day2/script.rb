# frozen_string_literal: true

lines = File.open('input').readlines.map(& :strip).reject(& :empty?)

def validate_part1(line)
  counters, character, password = line.split
  min, max = counters.split('-').map { |x| Integer(x) }
  character.tr!(':', '')

  character_count = password.count(character)
  return true if character_count >= min && character_count <= max

  false
end

def validate_part2(line)
  positions, character, password = line.split
  position1, position2 = positions.split('-').map { |x| Integer(x) }
  index1 = position1 - 1
  index2 = position2 - 1

  character.tr!(':', '')

  return true if password[index1].eql?(character) ^ password[index2].eql?(character)

  false
end

puts lines.select { |x| validate_part1 x }.count
puts lines.select { |x| validate_part2 x }.count
