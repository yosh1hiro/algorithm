class Array
  # 1, 0〜9までのバケツを用意
  # 2, 対象の位の桁数の値を取得
  # 3, 対応するバケツに数を格納
  # 4, 0のバケツから格納した順に配列に挿入
  # 5, 1に戻る(最大桁数に達するまで)

  def maximum_digit(base)
    (Math.log(self.minmax.map(&:abs).max)/Math.log(base)).floor + 1
  end

  def radix_sort(base)
    ary = dup
    maximum_digit(base).times do |i|
      buckets = buckets = Array.new(2*base){[]}  # 負の値に対応するため
      base_i = base ** i
      ary.each do |n|
        value = (n/base_i) % base
        value += base if 0<=n  # 負の値に対応するため
        buckets[value] << n
      end
      ary = buckets.flatten
    end
    ary
  end

  def radix_sort!(base=10)
    replace radix_sort(base)
  end
end
