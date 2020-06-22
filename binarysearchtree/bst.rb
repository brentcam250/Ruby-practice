

class BinarySearchTree

  def initialize(array)
    @root = build_tree(array) 
    @has_root = false
  end

  def build_tree(array)
    #takes in array of values, returns the root node of the binary search tree.
    array = array.sort
    array = array.uniq
    #sort and remove duplicates from the array.
    
    prev_node = nil
    while(array.length > 0)
      data = array.shift
      
      new_node = insert(data)
    end
  end

  def root 
    @root.data
  end

  def insert(value)
    #build a new node and insert it in the correct spot in the tree.
    new_node = BSTNode.new(value)
    unless @has_root
      @root = new_node
      @has_root = true
    end
    current_node = @root
    #start at the root and continue looking for the place to put the node.
    while(current_node.left_child && current_node.right_child)
      puts "comparing current: #{current_node.data} with new_node #{new_node.data}"
      if(new_node.data < current_node.data)
        current_node = current_node.left_child
      elsif(new_node.data > current_node.data)
        current_node = current_node.right_child
      else  
        puts "Something wrong with inserting, maybe a duplicate value?"
      end
    end
    #now we come to a leaf
    if(value < current_node.data)
      current_node.left_child = new_node
    else
      current_node.right_child = new_node
    end
    return true
  end

  def delete(value)

  end

  def find(value)
    #find value, return node with the value, or nil if not found
  end

  def level_order(block)
    #can be either iterative or recursive
  end

  def in_order(block)

  end

  def pre_order(block)

  end

  def post_order(block)

  end

  def depth(node)

  end

  def balanced?

  end

  def rebalance! 

  end

end

class BSTNode
  attr_accessor :data, :left_child, :right_child
  def initialize(data = nil, left_child = nil, right_child = nil)
    @data = data 
    @left_child = left_child
    @right_child = right_child
  end

  def to_s 
    output = "NODE: data:#{@data ? @data : "nil"} left_child: #{@left_child ? @left_child : "nil"} right_child: #{@right_child ? @right_child : "nil"}"
  end

end

test_array = [1,2,3]

test_tree = BinarySearchTree.new(test_array)

puts test_tree.root

# test_node = BSTNode.new(5)

# puts test_node