class BinarySearch
  def initialize(arr, val)
    @arr = arr.sort!
    @left = 0
    @right = arr.size - 1
    @mid = 0
    @val = val
  end

  attr_reader :arr

  def search
    @mid = (@left + @right) / 2
    p "mid=#{@mid}"
    if @arr[@mid] == @val
      p "found"
    elsif @arr[@mid] < @val
      @left = @mid + 1
      p "left=#{@left}"
      fail if @left == @arr.size - 2
      search
    elsif @arr[@mid] > @val
      @right = @mid - 1
      p "right=#{@right}"
      fail if @right == 2
      search
    end
  end
end

while true
  p "配列を入力"
  a = gets.split(" ").map(&:to_i)
  p "数字を入力"
  b = gets.chomp.to_i
  bs = BinarySearch.new(a,b)
  p bs.arr
  bs.search
  break
end
