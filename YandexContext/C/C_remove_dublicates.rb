prev_number = nil
count = nil
lines = []

File.foreach("input.txt") do |line|
  # read first line (don't used)
  if count == nil
    count = line.to_i
    next
  end
  #read lines with numbers
  if line.to_i != prev_number
    lines << line
    prev_number = line.to_i
  end
end

File.write("output.txt", lines.join, mode: "a")
