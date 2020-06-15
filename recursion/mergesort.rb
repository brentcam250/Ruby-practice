def merge_sort (array)
    if !array 
        puts "no array"
    end
    if array.length > 2
        a = merge_sort(array.slice(0, array.length/2))
        b = merge_sort(array.slice(array.length/2, array.length-1))
        if(a && b)
            return merge(a,b)
        else 
            puts "trying to pass nil arrays... "
            return 0
        end
    else 
        if array.length == 1 
            return array
        else
            if array[0] > array[1]
                output = [array[1], array[0]]
                puts "outputtting: #{output}"
                return output
            else
                return [array[0], array[1]]
                # return array
            end
        end
    end

end

def merge (arr1, arr2)
    total_length = arr1.length + arr2.length
    output_array = []
    while(arr1[0] && arr2[0])
        if(arr1[0] > arr2[0])
            output_array << arr2.shift
        else 
            output_array << arr1.shift
        end
    end
end

test_array = [10, 5, 3 , 6, 34, 1, 7 ]
test_array_length_1 = [1]

test_array_length_2 = [2,1]
puts merge_sort(test_array)
# merge_sort(test_array)