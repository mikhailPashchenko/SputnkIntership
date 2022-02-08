# frozen_string_literal: true

n = File.read('input.txt').to_i * 2

sequence_arr = [] # free array for sequences

def generator(open_counter, ind, len, sequence_arr)
  # put left bracket only if there is (open_counter + 1) free space
  if open_counter <= len - ind - 2
    sequence_arr[ind] = '('
    generator(open_counter + 1, ind + 1, len, sequence_arr)
  end
  # right bracket can be set if open_counter > 0
  if open_counter.positive?
    sequence_arr[ind] = ')'
    generator(open_counter - 1, ind + 1, len, sequence_arr)
  end
  return unless ind == len

  puts sequence_arr.join if open_counter.zero?
end

puts generator(0, 0, n, sequence_arr)
