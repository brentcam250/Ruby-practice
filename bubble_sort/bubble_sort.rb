# procedure bubbleSort(A : list of sortable items)
#     n := length(A)
#     repeat
#         swapped := false
#         for i := 1 to n-1 inclusive do
#             /* if this pair is out of order */
#             if A[i-1] > A[i] then
#                 /* swap them and remember something changed */
#                 swap(A[i-1], A[i])
#                 swapped := true
#             end if
#         end for
#     until not swapped
# end procedure

def bubble_sort(to_be_sorted)
  swapped = true;
  #this while loop goes until no swaps have been made, which means that the list must be sorted.
  while swapped
    swapped = false
    end_index = (to_be_sorted.length) -1
    for i in 1..end_index do 
      # puts "i = #{i}"
      # puts to_be_sorted[i-1]
      # p to_be_sorted[i]
      if (to_be_sorted[i-1] > to_be_sorted[i])
        #swap them
        temp_store = to_be_sorted[i-1]
        to_be_sorted[i-1] = to_be_sorted[i]
        to_be_sorted[i] = temp_store
        swapped = true
      end
    end
  end
  return to_be_sorted
end


test_array = [4,3,78,2,0,2, 102, 23, 1, 000, 4]
sorted = bubble_sort(test_array)
puts sorted


