# frozen_string_literal: true

groups = File.open('input').read.split(/\n{2}/)

def itterate_part1(groups)
  return 0 if groups.empty?

  group = groups.pop
  hash = {}

  group.lines.each do |line|
    line.strip.split('').each do |char|
      hash[char] = true
    end
  end
  hash.size + itterate_part1(groups)
end

def itterate_part2(groups)
  return 0 if groups.empty?

  group_lines = groups.pop.lines
  hash = {}

  group_lines.each do |line|
    line.strip.split('').each do |char|
      hash[char] = 0 unless hash.key? char
      hash[char] += 1
    end
  end

  hash.select { |_key, val| val == group_lines.count }.size + itterate_part2(groups)
end

puts itterate_part1 groups.dup

puts itterate_part2 groups.dup
