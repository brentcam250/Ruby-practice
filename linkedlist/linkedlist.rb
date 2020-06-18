class LinkedList
  #class to make a list of LinkedListNode objects
  def initialize()
    #@head = 
    #@tail =
    #@size =
  end

  def append(value)
    #add value to the end of the list
  end

  def prepend(value)

  end

  def size
    return this.size
  end
  
  def head 
    return this.head
  end

  def tail 
    return this.tail
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

end


class LinkedListNode
  #class for a single node to be used in the linked list
  attr_accessor :data, :pointer
  def initialize(data= nil, pointer = nil)
    @data = data,
    @pointer = pointer
  end

  def value 
    return @data
  end

  def next_node
    return @pointer
  end
end


