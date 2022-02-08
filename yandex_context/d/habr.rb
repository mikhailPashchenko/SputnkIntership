n = 10 # количество скобок

sequence_arr = [] # пустой массив, куда кладем скобки

left_minus_right = 0 # разница между количеством левых и правых скобок
i = 0 # индекс, по которому кладем скобку в массив

def generator(left_minus_right, i, n, sequence_arr)
  # кладем откр. скобку, только если хватает места для еще одной пары ()
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

generator(0, 0, n, sequence_arr)
