class Array
  def merge_sort!
    return self if length <= 1
    second_half = pop(length / 2)
    merge(merge_sort!, second_half.merge_sort!)
  end

  def merge(first_half, second_half)
    fh_length, sh_length = first_half.length, second_half.length
    rn, fn, sn = 0, 0, 0
    result = Array.new(fh_length + sh_length)
    a, b = first_half[0], second_half[0]
    loop do
      if a < b
        result[rn] = a
        rn += 1; fn += 1;
        break if fn >= fh_length
        a = first_half[fn]
      else
        result[rn] = b
        rn += 1; sn += 1;
        break if sn >= sh_length
        b = second_half[sn]
      end
    end

    while fn < fh_length
      result[rn] = first_half[fn]
      rn += 1; fn += 1;
    end

    while sn < sh_length
      result[rn] = second_half[sn]
      rn += 1; sn += 1;
    end
    result
  end


  =begin
    def merge_sort!
      return self if self.length <= 1
      a, b = self.half.map { |e| e.merge_sort! }
      merge(a,b)
    end

    def half
      mid = length / 2
      return slice(0..mid), slice(mid..-1)
    end

    def merge(a,b)
      res = []
      until a.empty? && b.empty?
        res <<
          case
          when a.empty? then b.shift
          when b.empty? then a.shift
          when a.first < b.first then a.shift
          else b.thift
          end
      end
      res
    end
  =end
end
