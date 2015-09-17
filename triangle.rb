def triangle(a)
  result = a.sort.each_cons(3).any? do |n1, n2, n3|
    n3 - n2 < n1
  end
  result ? 1 : 0
end
