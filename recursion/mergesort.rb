def merge_sort (array)
    if array.length > 2
        a = merge_sort(array.slice(0, array.length/2))
        b = merge_sort(array.slice(array.length/2, array.length-1))
        return [a,b]
    else 
        if array.length == 1 
            return array
        else
            if array[0] > array[1]
                return [array[1], array[0]]
            else
                # return [array[0], array[1]]
                return array
            end
        end
    end

end


test_array = [10, 5, 3 , 6, 34, 1, 7 ]
test_array_length_1 = [1]

test_array_length_2 = [2,1]
puts merge_sort(test_array)
# merge_sort(test_array)