

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
    #returns true if deleted properly, false otherwise
    target_node = find_with_parent(value)
    target_on_right = true
    if(target_node)
      to_be_deleted = target_node[1]
      parent_of_to_be_deleted = target_node[0]

      if(parent_of_to_be_deleted.left_child.data == value)
        #tobedeleted is on the left
        target_on_right = false
      end

      #section for dealing with cases of if the node we want to delete has children or not.
      if(to_be_deleted.is_leaf?)
        #no children, can just delete this straight off
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

      end

    else
      puts "delete: that value cannot be found in the tree"
      return false
    end
  end

  # def delete(value)
  #   target_node = find_with_parent(value)
  #   target_on_right = true

  #   if target_node
  #     to_be_deleted = target_node[1]
  #     parent_of_to_be_deleted = target_node[0]
  #     puts "parent = #{parent_of_to_be_deleted}"
  #     if(parent_of_to_be_deleted.left_child.data == value)
  #       #to be deleted is onthe left
  #       target_on_right = false
  #     end
  #     if(to_be_deleted.left_child.nil? && to_be_deleted.right_child.nil?)
  #       #no children so we can delete this worthless node
  #       if(target_on_right)
  #         #we have to make sure that we delete the appropriate child node if there are more than one
  #         parent_of_to_be_deleted.right_child = nil
  #       else
  #         parent_of_to_be_deleted.left_child = nil 
  #       end
  #     elsif (to_be_deleted.left_child.nil? || to_be_deleted.right_child.nil? )
  #       #only one child, can just move the child to take the place of the deleted node
  #       if(to_be_deleted.left_child.nil?)
  #         #the child is on the right
  #         if(target_on_right)
  #           parent_of_to_be_deleted.right_child = to_be_deleted.right_child
  #         else
  #           parent_of_to_be_deleted.left_child = to_be_deleted.right_child
  #         end
  #       else
  #         #child is on the left
  #         if(target_on_right)
  #           parent_of_to_be_deleted.right_child = to_be_deleted.left_child
  #         else
  #           parent_of_to_be_deleted.left_child = to_be_deleted.left_child
  #         end
          
  #       end
  #       puts "shuffle children about"
  #       puts parent_of_to_be_deleted
  #     end
  #   else
  #     puts " that node doesnt exist bozo"
  #     return false
  #   end
  # end

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
    elsif(this.is_leaf?)
      return false
    else
      return 0
    end

  end

end

test_array = [1,3,4,2]

array =  [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

test_tree = BinarySearchTree.new(test_array)

# puts test_tree.root


test_tree.delete(3)

puts test_tree.find(3)
# puts "find #{test_tree.find(8)}"
# puts "find #{test_tree.find(6345)}"


# test_node = BSTNode.new(5)

# puts test_node