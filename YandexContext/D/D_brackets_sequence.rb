n = File.read("input.txt").to_i

def brackets(n)
  result = ["()"]

  (n-1).times do
    temp_result = []
    result.each do |res|
      temp_result.push "(#{res})", "#{res}()", "()#{res}"
    end
    result = temp_result.uniq
  end
  result
end

puts result = brackets(n)
puts result.size
puts sorted_result = result.uniq.sort { |a, b| a <=> b }
puts sorted_result.size

File.write("output.txt", "\nn = #{n}\n" + sorted_result.join("\n"), mode: "a")