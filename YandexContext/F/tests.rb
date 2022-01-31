require_relative './F_interesting_travel'

def assert(filename, expected_value)
  result = Travel::TravelData.new(filename).roads_min_number
  if result != expected_value
    puts "error in test #{test}: expected #{expected_value}, got: result"
  end
end

assert("input.txt", 3)
assert("input2.txt", 1)
assert("input3.txt", -1)
assert("input4.txt", 2)
