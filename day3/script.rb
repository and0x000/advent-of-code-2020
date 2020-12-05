# frozen_string_literal:true

lines = File.open('input').readlines.map(& :strip).reject(& :empty?)

def move(lines, right = 3, down = 1)
  tree_count = 0
  line_position = 0
  lines.each_with_index do |line, index|
    next unless (index % down).zero?

    tree_count += 1 if line[line_position].eql?('#')

    line_position = (line_position + right) % line.size
  end
  tree_count
end

puts move lines

puts move(lines, 1, 1) *
     move(lines, 3, 1) *
     move(lines, 5, 1) *
     move(lines, 7, 1) *
     move(lines, 1, 2)
