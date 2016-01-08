class Heap
  attr_reader :elements

  def initialize
    @elements = [nil]
  end


  def enqueue(element)
    @elements << element
    bubble_up(array_end)
  end

  def dequeue
    exchange(1, array_end)
    min = @elements.pop
    bubble_down(1)
    min
  end

  private

    def bubble_up(index)
      parent_index = (index) / 2

      return if index <= 1
      return if @elements[parent_index] <= @elements[index]

      exchange(parent_index, index)
      bubble_up(parent_index)
    end

    def bubble_down(index)
      child_index = (2 * index)

      return if child_index > array_end

      status = child_index < array_end
      left_element = @elements[child_index]
      right_element = @elements[child_index + 1]

      child_index += 1 if status && right_element < left_element

      return if @elements[index] <= @elements[child_index]

      exchange(index, child_index)
      bubble_down(child_index)
    end

    def exchange(source, target)
      @elements[source], @elements[target] = @elements[target], @elements[source]
    end

    def array_end
      @elements.size - 1
    end
end
