n = File.read("input.txt").to_i * 2

sequence_arr = [] # пустой массив, куда кладем скобки

def generator(left_minus_right, i, n, sequence_arr)
  # кладем откр. скобку, только если хватит места для (left_minus_right + 1) закрыв. скобок
  if (left_minus_right <= n - i - 2)
    sequence_arr[i] = '('
    generator(left_minus_right + 1, i + 1, n, sequence_arr)
  end
  # закр. скобку можно положить всегда, если left_minus_right > 0
  if left_minus_right > 0
    sequence_arr[i] = ')'
    generator(left_minus_right-1, i+1, n, sequence_arr)
  end
  # выходим из цикла и печатаем
  if i == n
    if left_minus_right == 0
      puts sequence_arr.join()
    end
  end
end

puts generator(0,0,n,sequence_arr)
