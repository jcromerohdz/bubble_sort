# frozen_string_literal: true

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
      next unless element > next_element

      arr[i] = next_element
      arr[i + 1] = element
      swapped_elements = true
    end
  end

  arr
end

def bubble_sort_by(arr)
  raise 'No block given' unless block_given?
  
  swap = -1
  while swap != 0
    swap = 0
    (0..(arr.length - 2)).each do |i|
      if yield(arr[i], arr[i + 1]).positive?
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swap += 1
      end
    end
  end
  output = arr.join(', ')
  output
end
p bubble_sort([4, 3, 78, 2, 0, 2])
p bubble_sort_by(%w[hey hello hi])
p bubble_sort_by(%w[hey hello hi]) { |left, right| left.length - right.length }
