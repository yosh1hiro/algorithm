class Array
  def quick_sort!
    return self if size <= 1
    pivot = self[0] >= self[1] ? self[0] : self[1]
    left = []
    right = []
    each do |a|
      if a < pivot
        left << a
      else
        right << a
      end
    end
    left.quick_sort! + right.quick_sort!
  end

  =begin
  def quick_sort
    return self if self.length <= 1
    pivot = self[0] >= self[1] ? self[0] : self[1]
    left, right = partition { |e| e < pivot }
    left.quick_sort + right.quick_sort
  end
  =end
end
