first, second = File.readlines("input.txt").map { |line| line.chomp.chars }

# first way
result = 0
result = 1 if first.sort { |a, b| a <=> b } == second.sort { |a, b| a <=> b }

#second way


File.write("output.txt", result)