class Heap
  attr_reader :elements

  def initialize
    @elements = []
  end


  def enqueue(element)
    @elements << element
    bubble_up(array_end)
  end

  def dequeue
    exchange(0, array_end)
    max = @elements.pop
    bubble_down(0)
    max
  end

  private

    def bubble_up(index)
      parent_index = (index / 2)

      return if index == 0
      return if @elements[parent_index] <= @elements[index]

      exchange(parent_index, index)
      bubble_up(parent_index)
    end

    def bubble_down(index)
      child_index = (2 * index + 1)

      return if child_index > array_end

      status = child_index < array_end
      parent_element = @elements[index]
      left_element = @elements[child_index]
      right_element = @elements[child_index + 1]

      if parent_element > left_element
        if status && right_element < left_element
          exchange(index, child_index + 1)
          child_index += 1
        else
          exchange(child_index, index)
        end
      elsif status && parent_element > right_element
        exchange(index, child_index + 1)
        child_index += 1
      else
        return
      end

      bubble_down(child_index)
    end

    def exchange(source, target)
      @elements[source], @elements[target] = @elements[target], @elements[source]
    end

    def array_end
      @elements.size - 1
    end
end
