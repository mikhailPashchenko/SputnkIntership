require 'pry'
n = 4
first_s = "("*n + ")"*n
s_arr = []
s_arr << first_s

m = n-1
i = 2*n-1

while m < 2*n-1
  s = s_arr.last.clone
  j = i
  while s[j] != "("
    j -= 1
  end
  biing.pry
  s[j] = ")"
  s[j+1] = "("
  s_arr << s
  #puts s
  m += 1
end