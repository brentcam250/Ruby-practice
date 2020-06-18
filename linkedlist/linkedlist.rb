#written by Brent Cameron June 2020

class LinkedList
  #class to make a list of LinkedListNode objects
  attr_accessor :head, :tail, :size
  def initialize(data)
    @head = LinkedListNode.new(data) 
    @tail = @head
    @size = 1
  end

  def append(value)
    #add value to the end of the list
    @size += 1
    new_node = LinkedListNode.new(value)
    @tail.pointer = new_node 
    @tail = new_node
  end

  def prepend(value)
    #put a new node at the beginning of the list
    @size += 1
    new_node = LinkedListNode.new(value)
    new_node.pointer = @head
    @head = new_node
  end

  def at(index)
    #returns node at index or false if index is outside of the list
    if(index > @size - 1)
      return false
    end
    current_index = 0
    current_node = @head
    until (current_index == index || current_node.pointer == nil)
      current_node = current_node.pointer
      current_index += 1
    end
    if(current_index == index)
      return current_node
    elsif current_index + 1 == index
      return current_node.pointer
    else
      return false
    end
  end

  def pop
    #remove and return the tail.
    current = @head
    previous = current
    if current.pointer == nil
      #then the head is also the tail. 
      to_return = @head
      @head = nil
      @tail = nil 
      @size -= 1
      return to_return
    else
      #move once to get current ahead of previous
      current = current.pointer
    end
    until(current.pointer == nil)
      current = current.pointer
      previous = previous.pointer
    end 

    previous.pointer = nil 
    #remove the second last ones pointer so that it will now be the tail
    @size -= 1 
    return current
  end

  def contains?(value)
    #search the list for value, return either true or false.
    current = @head
    output = false
    until (current.data[0] == value || current.pointer == nil)
      if current.data[0] == value 
        output = true
      end
      current = current.pointer 
    end
    if current.data[0] == value
      #need this to check the last nodes data. 
      output = true
    end
    return output
  end

  def find(value)
    #returns the index of first occurence of value or nil if not found
    current = @head
    index = 0
    until (current.data[0] == value || current.pointer == nil)
      if(current.data[0] == value)
        return index
      end
      index += 1 
      current = current.pointer
    end
    if current.data[0] == value
      return index
    end
    return nil

  end

  def to_s
    #format: ( value ) -> ( value ) -> ( value ) -> nil
    current = @head
    if(current == nil)
      return "empty list"
    end

    output_string = ''
    while(current.pointer)
      #without the array notation, theres a nil value that i dont know where it comes from.
      output_string += " ( #{current.data[0]} ) -> "
      current = current.pointer

    end
    output_string += " ( #{current.data[0]} ) -> "
    output_string += " nil"
    return output_string
  end

end


class LinkedListNode
  #class for a single node to be used in the linked list
  attr_accessor :data, :pointer
  def initialize(data)
    @data = data,
    @pointer = nil
  end

  # def value 
  #   return @data
  # end

  def next_node
    return @pointer
  end
end


# node = LinkedListNode.new(1)
# puts node.data
# print node.next_node unless node.next_node == nil

testList = LinkedList.new('hi')
# puts testList.head.data

# puts testList.size


# testList.append('howareya')
# testList.append('bye')

# testList.prepend('hullo')

# puts testList.tail.value

# puts testList

# puts testList.find('bye')

# puts testList.size

# if testList.find('5') == nil
#   puts "nil"
# end

# puts testList.at(1).data[0]

# puts testList.at(2).data[0]

# puts testList.at(8)

# puts testList.size

puts testList.pop.data

puts testList