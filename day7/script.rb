# frozen_string_literal: true

lines = File.open('input').readlines.map(&:strip)

def itterate_part1(lines, type_o_bag)
  return [] if type_o_bag == ''

  lines_containing_bag = lines.select { |line| line.match(/.+#{type_o_bag}.*/) }
  outer_bags = lines_containing_bag.map { |line| line.split('s contain').first }
  outer_bags.count + outer_bags.map { |bag| itterate_part1(lines, bag) }.count
end

puts itterate_part1 lines, 'shiny gold bag'
