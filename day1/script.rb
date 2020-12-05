# frozen_string_literal:true

require 'benchmark'

numbers = File.open('input').readlines.map(& :strip).reject(& :empty?).map { |x| Integer(x) }

numbers_loop1 = numbers.dup

Benchmark.bm do |x|
  x.report do
    while (number_1 = numbers_loop1.pop)
      numbers_loop2 = numbers_loop1.dup
      while (number_2 = numbers_loop2.pop)
        if number_1 + number_2 == 2020
          puts number_1 * number_2
        elsif number_1 + number_2 > 2020
          next # the condition for the second part is unfullfillable
        else
          numbers_loop3 = numbers_loop2.dup
          while (number_3 = numbers_loop3.pop)
            puts number_1 * number_2 * number_3 if number_1 + number_2 + number_3 == 2020
          end
        end
      end
    end
  end
end
