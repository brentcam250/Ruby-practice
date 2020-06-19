

class BinarySearchTree

  def initialize(array)
    @root = build_tree(array) 

  end

  def build_tree(array)

  end

  def insert(value)

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
  def initialize(data = nil)
    @data = data,
    @left_child = nil
    @right_child = nil
  end
end