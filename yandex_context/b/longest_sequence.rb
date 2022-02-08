# frozen_string_literal: true

file = File.open('input.txt')

file.readline  # go to second line
sum = 0
temp_sum = 0

file.readlines.map do |line|
  case line.chomp
  when '1'
    temp_sum += 1
    sum = [temp_sum, sum].max
  when '0'
    temp_sum = 0
  end
end

File.write('output.txt', sum)
