class Array
  def bubble_sort!
    array = self.dup
    (length - 1).times do
      (length - 1).times do |i|
        array[i + 1], array[i] = array[i], array[i + 1] if array[i] > array[i+1]
      end
    end
    self.replace(array)
  end
end
