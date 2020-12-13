# frozen_string_literal: true

groups = File.open('input').read.split(/\n{2}/)

def itterate(groups)
  return 0 if groups.empty?

  group = groups.pop
  hash = {}

  group.lines.each do |line|
    line.strip.split('').each do |char|
       hash[char] = true
    end
  end
  hash.size + itterate(groups)
end

puts itterate groups
