def abs_distinct(a)
  count = 0
  already = {}
  a.each do |e|
    count += 1 unless already[e.abs]
    already[e.abs] = true
  end
  count
end
