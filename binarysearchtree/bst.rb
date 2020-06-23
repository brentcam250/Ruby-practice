

class BinarySearchTree
  attr_accessor :root, :has_root

  def initialize(array)
    array = array.sort
    array = array.uniq
    @root = build_balanced_tree(array) 
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

  def build_balanced_tree(array)
    #takes in sorted array, recursively builds a balanced BST 
    unless(array.length >= 1)
      return nil
    end
    # puts "length = #{array.length}"
    mid = (array.length/2) -1 
    # puts "mid = #{mid}"
    root = BSTNode.new(array[mid])
    left_array = array.slice(0..mid)
    right_array = array.slice(mid+1..-1)
    # puts "array mid = #{array[mid]}"
    # puts "array = #{array}"
    # puts "left sub array = #{left_array}"
    # puts "right sub array = #{right_array}"
    root.left_child = build_balanced_tree(left_array) unless left_array.length <= 1
    root.right_child = build_balanced_tree(right_array) unless right_array.length <= 1
    # root.left_child = build_balanced_tree(array.slice(0..mid))
    # root.right_child = build_balanced_tree(array.slice(mid+1..-1))
    @root = root

    return root

  end

  def insert(starting_node = @root, value)
    #recursive insert method

    # unless(@has_root)
    #   puts "i shouldnt be here"
    #   @has_root = true
    #   new_node = BSTNode.new(value)
    #   @root = new_node
    #   return new_node
    # end

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
    #returns true if deleted properly, false otherwise
    target_node = find_with_parent(value)
    target_on_right = true
    if(target_node)
      to_be_deleted = target_node[1]
      parent_of_to_be_deleted = target_node[0]

      puts "parent: #{parent_of_to_be_deleted} \n\n"
      puts "to_be_deleted: #{to_be_deleted}"
      if(parent_of_to_be_deleted.left_child.nil?)
        #target_on_right remains true
      elsif(parent_of_to_be_deleted.right_child.nil?)
        target_on_right = false

      elsif(parent_of_to_be_deleted.left_child.data == value)
        #tobedeleted is on the left
        target_on_right = false
      end

      #section for dealing with cases of if the node we want to delete has children or not.
      if(to_be_deleted.is_leaf?)
        #no children, can just delete this straight off
        puts "its a leaf!"
        if(target_on_right)
          parent_of_to_be_deleted.right_child = nil
          return true
        else
          parent_of_to_be_deleted.left_child = nil
          return true
        end
      elsif(to_be_deleted.find_children == 1)
        #has only right child in this case we can move the one child into the space previously occupied by the to_be_deleted
        target_on_right ? parent_of_to_be_deleted.right_child = to_be_deleted.right_child : parent_of_to_be_deleted.left_child = to_be_deleted.right_child
        return true
      elsif(to_be_deleted.find_children == -1)
        #has only left child
        target_on_right ? parent_of_to_be_deleted.right_child = to_be_deleted.left_child : parent_of_to_be_deleted.left_child = to_be_deleted.left_child
        return true
      else
        #to_be_deleted has two children
        puts "shit it has two childs"

      end

    else
      puts "delete: that value cannot be found in the tree"
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

  #block is a starting node, reads until the bottom
  def level_order(block = @root)
    #can be either iterative or recursive
    output = []
    queue = []
    queue.push(block)
    while(queue.length > 0)
      current_node = queue.shift
      # puts "printing out kids #{current_node.data}"
      output.push(current_node.data)
      children = current_node.return_children
      if(children)
        children.each do |child|
          queue.push(child)
        end
      end
    end
    return output
  end

  def in_order(block = @root)

    if(block)
      in_order(block.left_child) unless block.left_child.nil?
      puts block.data
      in_order(block.right_child) unless block.right_child.nil?
    end

    
  end

  def pre_order(block = @root)

    if(block)
      puts block.data
      pre_order(block.left_child) unless block.left_child.nil?
      pre_order(block.right_child) unless block.right_child.nil?
    end

  end

  def post_order(block = @root)

    if(block)
      post_order(block.left_child) unless block.left_child.nil?
      post_order(block.right_child) unless block.right_child.nil?
      puts block.data
    end

  end

  def depth(node = @root)
    #recursively calculate the max of the left/right subtrees to find the tallest one 
    max_depth = 0
    unless node 
      return 0
    else 
      left = depth(node.left_child)
      right = depth(node.right_child)
      left > right ? max_depth = left + 1 : max_depth = right + 1 
    end
    return max_depth

  end

  def balanced?(node = @root)

    unless node 
      return true
    end

    left_depth = depth(node.left_child)
    right_depth = depth(node.right_child)
    if(((left_depth - right_depth).abs <=1) && balanced?(node.left_child) && balanced?(node.right_child))
      return true
    end

    return false


  end

  def rebalance! 
    if(balanced?)
      puts " it was already balanced"
      return false
    else
      level_order_array = level_order.sort
      puts  "level order = #{level_order_array} "
      new_root = build_balanced_tree(level_order_array)
      return new_root
    end

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

  def is_leaf?
    if(left_child.nil? && right_child.nil?)
      return true
    else
      return false
    end
  end

  def find_children
    #returns 1 if right only, -1 if left only 0 if two children, false if none
    if(left_child.nil? && !right_child.nil?)
      #only a right child
      return 1
    elsif (!left_child.nil? && right_child.nil?)
      #only a left child
      return -1
    elsif(is_leaf?)
      return false
    else
      return 0
    end

  end

  def return_children
    #returns the actual nodes of the children, or false if there are none
    if(find_children == false)
      return false
    elsif(find_children == 1)
      return [right_child]
    elsif(find_children == -1)
      return [left_child]
    else
      return [left_child, right_child]
    end
  end

end

test_array = [1,3,4,2]

array =  [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

rand = Array.new(15) {rand(1..100)}

test_tree = BinarySearchTree.new(rand)

# puts test_tree.root


# puts test_tree.delete(8)

# puts test_tree.find_with_parent(9)

# puts test_tree.in_order

# puts "pre #{test_tree.pre_order} "

# puts test_tree.balanced?

# puts test_tree.level_order

#puts test_tree.rebalance!

# test_tree.insert(100)
# puts test_tree.in_order


puts "balanced?"

puts test_tree.balanced?

puts "traversals"

puts test_tree.level_order
puts test_tree.pre_order
puts test_tree.post_order
puts test_tree.in_order

test_tree.insert(100)
test_tree.insert(101)
test_tree.insert(102)
test_tree.insert(103)
test_tree.insert(104)
test_tree.insert(105)

puts "inserted a bunch, is it balanced?"
puts test_tree.balanced?

puts test_tree.rebalance!
puts "rebalanced did it work??"
puts test_tree.balanced?


puts "traversals"

puts test_tree.level_order
puts test_tree.pre_order
puts test_tree.post_order
puts test_tree.in_order


# puts test_tree.find(3)
# puts "find #{test_tree.find(8)}"
# puts "find #{test_tree.find(6345)}"


# test_node = BSTNode.new(5)

# puts test_node