# frozen_string_literal: true

prev_number = ''
count = :first_read
lines = []

File.foreach('input.txt') do |line|
  # read first line (don't used)
  if count == :first_read
    count = line.to_i
    next
  end
  # read lines with numbers
  unless line.to_i == prev_number
    lines << line
    prev_number = line.to_i
  end
end

File.write('output.txt', lines.join, mode: 'a')
