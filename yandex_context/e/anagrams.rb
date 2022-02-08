# frozen_string_literal: true

first, second = File.readlines('input.txt').map { |line| line.chomp.chars }

# first way
result = 0
result = 1 if first.sort == second.sort

File.write('output.txt', result)
