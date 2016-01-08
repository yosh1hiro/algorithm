class Array
  def heap_sort!
    i = array_end
    while i >= 0
      bubble_down(i)
      i -= 1
    end
    n = array_end
    hs = []
    while n >= 0
      hs << extract_min
      n -= 1
    end
    hs
  end

  def bubble_down(index)
    child_index = index * 2 + 1

    return if child_index > array_end

    status = child_index < array_end
    left_element = self[child_index]
    right_element = self[child_index + 1]
    child_index += 1 if status && right_element < left_element

    return if self[index] <= self[child_index]

    exchange(index, child_index)
    bubble_down(child_index)
  end

  def extract_min
    exchange(0, array_end)
    min = pop
    bubble_down(0)
    min
  end

  def exchange(source, target)
    self[target], self[source] = self[source], self[target]
  end

  def array_end
    size - 1
  end
end
