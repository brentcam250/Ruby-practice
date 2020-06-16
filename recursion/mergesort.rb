def merge_sort (array)
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
        puts "returning array of length #{array.length} this shouldnt happen"
    end

end

def merge (arr1, arr2)
    #takes two lists which we assume are sorted, and makes them into one sorted list
    total_length = arr1.length + arr2.length
    output_array = []
    until(arr1[0].nil? || arr2[0].nil?)
       #if theres values in both, then we need to compare which is smaller and put that in the output array 
        arr1[0] > arr2[0] ? output_array << arr2.shift : output_array << arr1.shift
    end
    # these next loops come when theres only values left in one, shovel all the values onto the output array
    until arr1.length == 0
        output_array << arr1.shift
    end
    until arr2.length == 0 
        output_array << arr2.shift
    end
    return output_array
end

test_array = [0,10, 5, 3 , 6, 34, 1, 7, 5, 5 , 5 ,100, 20 ,-10, 0,9997865567657857578578558]
test_array_length_1 = [ 1,5,6,7,8,90,121121]
test_array_length_3 = [1,1,4, 6, 9]


# print merge(test_array_length_1, test_array_length_3)


print  merge_sort(test_array) 
puts ""
# merge_sort(test_array)