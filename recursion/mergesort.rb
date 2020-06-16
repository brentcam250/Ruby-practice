def merge_sort (array)
    puts "in the beginning there was #{array}"
    if !array
        puts "no array"
    end
    if array.length > 2
        a = merge_sort(array.slice(0, (array.length/2)))
        b = merge_sort(array.slice(array.length/2, array.length-1))
        return merge(a,b) unless(a.nil? || b.nil?)
        # if(a && b)
        #     return merge(a,b)
        # else 
        #     puts "trying to pass nil arrays... "
        #     return 0
        # end
    elsif array.length == 2 
        if array[0] > array[1]
            reverse = [array[1], array[0]]
            puts "returning #{reverse} reverse order from the length 2 branch"
            return reverse
        else 
            puts "returning #{array} from length 2 branch"
            return array
        end
    elsif array.length == 1
        puts "returning #{array} from the length 1 branch"
        return array
        
    else 
        puts "returning array of length #{array.length}"
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
    return output_array
end

test_array = [10, 5, 3 , 6, 34, 1, 7 ]
test_array_length_1 = [1]

test_array_length_2 = [2,1]
puts merge_sort(test_array)
# merge_sort(test_array)