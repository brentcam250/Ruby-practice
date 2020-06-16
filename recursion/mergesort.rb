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
            
            return reverse
        else 
           
            return array
        end
    elsif array.length == 1
        
        return array
        
    else 
        puts "returning array of length #{array.length}"
    end

end

def merge (arr1, arr2)
    #takes two lists which we assume are sorted, and makes them into one sorted list
    total_length = arr1.length + arr2.length
    output_array = []
    until(arr1[0].nil? || arr2[0].nil?)
        # puts "arr1[0] #{arr1[0]} and arr2[0] #{arr2[0]}"
        arr1[0] > arr2[0] ? output_array << arr2.shift : output_array << arr1.shift
        # puts "output is #{output_array}"
        # if(arr1.nil?)
        #     output_array << arr2.shift
        # elsif (arr2.nil?)
        #     output_array <<arr1.shift
        # elsif (arr1[0] > arr2[0])
        #     output_array << arr2.shift
        # else
        #     output_array << arr1.shift
        # end

        # if(arr1[0] > arr2[0])
        #     output_array << arr2.shift
        # else 
        #     output_array << arr1.shift
        # end
    end
    until arr1.length == 0
        output_array << arr1.shift
        # puts "arr1.shift #{arr1.shift}"
    end
    until arr2.length == 0 
        output_array << arr2.shift
    end
    return output_array
end

test_array = [10, 5, 3 , 6, 34, 1, 7, 5, 5 , 5 ,100, 20 ,-10, 0]
test_array_length_1 = [3,7 ,8 ]
test_array_length_3 = [1,1,4, 6, 9]


# print merge(test_array_length_1, test_array_length_3)


print  merge_sort(test_array)
# merge_sort(test_array)