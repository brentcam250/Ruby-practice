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

  end

  def size
    return @size
  end
  
  def head 
    return @head
  end

  def tail 
    return @tail
  end

  def at(index)
    #returns element at index
  end

  def pop
    #remove and return the tail.
  end

  def contains?(value)
    #search the list for value, return either true or false.
  end

  def find(value)
    #returns the index of value or nil if not found

  end

  def to_s
    #format: ( value ) -> ( value ) -> ( value ) -> nil
    current = @head
    puts "before stuff #{@head.data[0]} "
    puts "before stuff pointer #{@head.pointer.data} "

    output_string = ''
    while(current.pointer)
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
puts testList.head.data

testList.append('howareya')
testList.append('bye')


# puts testList.tail.value

puts testList.to_s