#Note, I did take some inspiration from a solution on the internet for this one. 
def heavy_decimal_count(a, b)
  count = 0
  while (a <= b) do
    offset = calc_offset(a)
    
    if offset < 0
      a += offset.abs
    else
      a += 1
      count += 1 if offset > 0
    end
  end
  count
end

def calc_offset(num)
  offset = 0
  while (num > 0) do
    offset += (num % 10) - 7
    num = num / 10
  end
  offset
end

