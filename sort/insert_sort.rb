class Array
  def insert_sort!
    inject([]) { |a, n| a.insert_with_order(n) }
  end

  def insert_with_order(num)
    position = find_index { |i| num <= i } || length
    insert(position, num)
  end
end
