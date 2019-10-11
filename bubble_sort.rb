def bubble_sort(arr)
  array_length = arr.length
  return arr if array_length < 2

  max_index = array_length - 2
  swapped_elements = true

  while swapped_elements
    swapped_elements = false

    (0..max_index).each do |i|
      element = arr[i]
      next_element = arr[i + 1]

      if element > next_element
        arr[i], arr[i + 1] = next_element, element
        swapped_elements = true
      end
    end
  end

  arr
end

def bubble_sort_by(arr)
  if block_given?
    p "we have a block"
    swap = -1
    while swap != 0
      swap = 0
      for i in 0..(arr.length - 2)
        if (yield(arr[i], arr[i + 1]) > 0)
          arr[i], arr[i + 1] = arr[i + 1], arr[i]
          swap += 1
        end
      end
    end
  else
    arr.sort
  end
  puts "--------------"
  output = arr.join(", ")
  puts "[#{output}]"
end

p bubble_sort([4, 3, 78, 2, 0, 2])

bubble_sort_by(["hey", "hello", "hi"]) { |left, right| left.length - right.length }
