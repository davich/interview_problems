def equalization_steps(a)
  range = a.max - a.min
  return -1 if range % 2 == 1
  steps_to_center = range / 2
  center = a.min + steps_to_center
  for i in a
    distance_from_center = (center - i).abs
    if (steps_to_center - distance_from_center) % 2 == 1
      return -1
    end
  end
  steps_to_center
end
