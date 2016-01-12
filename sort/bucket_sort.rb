# 要素の取りうる範囲が有限個に限られている場合にのみ使える方法。
# mergesort, quicksort, heapsort といった比較ソートよりも高速。比較ソートにはO(nlogn)という超えられない壁があるが、比較しないソートであるバケットソートはあっさりそれを凌駕する

class Array
  def bucket_sort
    inject([]) { |a, i| a[i] = i; i }.compact
  end
end
