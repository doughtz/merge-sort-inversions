# Using MergeSort to count inversions
$inversion_count = 0
def inversionator(array)
  if array.length == 1
    return array
  end
  # split array into 2 until easy to solve
  # AKA to 1. Divide
  left = inversionator(array.slice!(0,array.length/2))
  right = inversionator(array)
  # Compare left array to right array to determine order
  # AKA to 2. Conquer
  counter = 0
  i = 0
  j = 0
  z = Array.new
  inversions = 0
  while counter < (left.length + right.length)
    if right[j].nil? || !left[i].nil? && left[i] <= right[j]
      z[counter] = left[i]
      i += 1
      counter += 1
    else
      # Add to inversion count if the right array has to be moved to the new array and there are still numbers in the left array
      z[counter] = right[j]
      j += 1
      $inversion_count += left.length - left.index(left[i]) if !left[i].nil?
      counter += 1
    end
  end
  return z
end