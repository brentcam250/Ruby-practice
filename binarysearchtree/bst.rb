

class BinarySearchTree
  attr_accessor :root, :has_root

  def initialize(array)
    @root = build_tree(array) 
    @has_root = false
  end

  def build_tree(array)
    #takes in array of values, returns the root node of the binary search tree.
    # array = array.sort
    array = array.uniq
    #sort and remove duplicates from the array. 

    #insert the root so we have a node to return as the instance variable @root   
    root_value = array.shift
    root_node = insert(nil, root_value)

    #for the rest of the values in array, call the insert method
    while(array.length > 0)
      new_value = array.shift
      new_node = insert(root_node, new_value)
    end

    return root_node

  end

  def insert(starting_node, value)
    #recursive insert method
    
    unless(@has_root)
      @has_root = true
      new_node = BSTNode.new(value)
      @root = new_node
      return new_node
    end

    if(value < starting_node.data)
      if(starting_node.left_child)
        #call insert again on the left subtree
        insert(starting_node.left_child, value)
      else
        #no node here, so we have found the spot for our new node
        new_node = BSTNode.new(value)
        starting_node.left_child = new_node
        return new_node
      end

    elsif(value > starting_node.data)
      if(starting_node.right_child)
        insert(starting_node.right_child, value)
      else
        new_node = BSTNode.new(value)
        starting_node.right_child = new_node
        return new_node
      end
    else 
      puts "equal values or some other error when inserting nodes"
    end
    return false

  end

  def delete(value)
    target_node = find_with_parent(value)
    if target_node
      to_be_deleted = target_node[1]
      parent_of_to_be_deleted = target_node[0]
      if(to_be_deleted.left_child.nil? && to_be_deleted.right_child.nil?)
        #no children so we can delete this worthless node
        if(parent_of_to_be_deleted.left_child.data == value)
          #we have to make sure that we delete the appropriate child node if there are more than one
          parent_of_to_be_deleted.left_child = nil
        else
          parent_of_to_be_deleted.right_child = nil 
        end
      else
        puts "shuffle children about"
      end
    else
      puts " that node doesnt exist bozo"
      return false
    end
  end

  def find_with_parent(starting_node = @root, parent_node = nil, value)
      #find value, return array of nodes 
      #first value is the parent, second is the node with the target value
      #with the value, or false if not found
      #use recursion to search through sub trees
      
      if(value == starting_node.data)
  
        return [parent_node, starting_node]
  
      elsif(value < starting_node.data)
  
        unless(starting_node.left_child.nil?)
          find_with_parent(starting_node.left_child, starting_node, value)
        else
          return false
        end
  
      else
  
        unless(starting_node.right_child.nil?)
          find_with_parent(starting_node.right_child, starting_node, value)
        else
          return false
        end
  
      end
  end
  

  def find(starting_node = @root, value)
    #find value, return node with the value, or false if not found
    #use recursion to search through sub trees
    
    if(value == starting_node.data)

      return starting_node

    elsif(value < starting_node.data)

      unless(starting_node.left_child.nil?)
        find(starting_node.left_child, value)
      else
        return false
      end

    else

      unless(starting_node.right_child.nil?)
        find(starting_node.right_child, value)
      else
        return false
      end

    end

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
    output = "(NODE: data:#{@data ? @data : "nil"} left_child: #{@left_child ? @left_child : "nil"} right_child: #{@right_child ? @right_child : "nil"})"
  end

end

test_array = [1,3,4,2]

array =  [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

test_tree = BinarySearchTree.new(array)

# puts test_tree.root

puts test_tree.find_with_parent(6345)

test_tree.delete(324)

puts test_tree.find(324)
# puts "find #{test_tree.find(8)}"
# puts "find #{test_tree.find(6345)}"


# test_node = BSTNode.new(5)

# puts test_node