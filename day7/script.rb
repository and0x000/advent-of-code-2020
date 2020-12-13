# frozen_string_literal: true

lines = File.open('input').readlines.map(&:strip)

def itterate_part1(lines, type_o_bag)
  return 0 if type_o_bag == ''

  bags_containing_bag = lines.map do |line|
    line.match(/(.+) bags contain.+#{type_o_bag}.*/)&.captures
  end.flatten.reject(&:nil?)

  bags_containing_bag << bags_containing_bag.map { |bag| itterate_part1(lines, bag) }
end

puts itterate_part1(lines, 'shiny gold bag').flatten.uniq.count
