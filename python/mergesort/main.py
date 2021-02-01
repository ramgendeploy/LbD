def mergeSort(input_array):
  if len(input_array) > 1:

    mid = len(input_array)//2

    left = input_array[:mid]
    right = input_array[mid:]

    mergeSort(left)
    mergeSort(right)

    left_index=0
    right_index=0
    input_index=0

    while left_index < len(left) and right_index < len(right):
      if left[left_index] < right[right_index]:
        input_array[input_index] = left[left_index]
        left_index+=1
      else:
        input_array[input_index] = right[right_index]
        right_index+=1
      input_index += 1
    
    while left_index < len(left):
      input_array[input_index] = left[left_index]
      left_index += 1
      input_index += 1 
    
    while right_index < len(right):
      input_array[input_index] = right[right_index]
      right_index += 1
      input_index += 1

if __name__ == '__main__':
  toSort = [3,2,4,6,783,65,23,4,2,35,2,1,23]
  print(toSort, end="\n")
  mergeSort(toSort)
  print(toSort)
