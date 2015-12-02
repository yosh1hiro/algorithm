class LinearSearch
  def self.linear_search(a,b)
    n = 0
    while n < a.length
      if (a[n] == b)
        p n.to_s  + "個めにあった"
        break
      else
        p n
        n += 1
        p "なし" if n == a.length
      end
    end
  end
end

while true
  p "配列を入力"
  a = gets.split(" ").map(&:to_i)
  p a
  p "数字を入力"
  b = gets.chomp.to_i
  p b
  LinearSearch.linear_search(a,b)
  break
end
