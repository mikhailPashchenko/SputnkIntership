j_arr, s_arr = File.open("input.txt").readlines.map {|line| line.chomp.chars }

sj_count = 0

s_arr.each { |s| sj_count += 1 if j_arr.include?(s) }
File.write("output.txt", sj_count)
