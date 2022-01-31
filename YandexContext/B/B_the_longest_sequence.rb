file = File.open("input.txt")

count = file.readline  # don't used
sum = 0
temp_sum = 0

file.readlines.map do |line|
  if line.chomp == "1"
    temp_sum += 1
    sum = [temp_sum, sum].max
  elsif line.chomp == "0"
    temp_sum = 0
  end
end

File.write("output.txt", sum)
