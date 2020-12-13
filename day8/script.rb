# frozen_string_literal: true

lines = File.open('input').readlines.map(&:strip)

accumulator = 0
index = 0
visited_indexes = {}

while true do

  line = lines[index]

  command, value = line.split

  accumulator += Integer(value) if command.eql? 'acc'
  index += 1

  index += (Integer(value) - 1) if command.eql? 'jmp'
  
  break if visited_indexes.key? index
  visited_indexes[index] = true
  next
end

puts accumulator
