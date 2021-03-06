# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

require 'bst_node'

class BinarySearchTree
  attr_accessor :root

  #keeps track of the second to last level node before the target
  attr_accessor :parent

  def initialize
    @root = nil
  end


#LOOKS like its working, just need find to work to pass the specs
  def insert(value)
    inserted = false

    if @root.nil?
      @root = BSTNode.new(value)
      inserted = true
    end

    current_node = @root

    until inserted
      # p current_node.value
      # p value

      if value <= current_node.value && current_node.left.nil?
        # p "inserted left"
        current_node.left = BSTNode.new(value)
        inserted = true
      elsif value <= current_node.value
        # p "switching to left child"
        current_node = current_node.left
        next
      elsif value > current_node.value && current_node.right.nil?
        # p "inserted right"
        current_node.right = BSTNode.new(value)
        inserted = true
      elsif value > current_node.value
        # p "switching to right child"
        current_node = current_node.right
        next
      end
    end

  end


  def find(value, tree_node = @root)
    curr_node = @root
    #base case for root
    # return @root if value == @root.value

    while curr_node.left || curr_node.right || value == curr_node.value

      #base case
      return curr_node if value == curr_node.value

      if value <= curr_node.value
        @parent = curr_node
        curr_node = curr_node.left
      elsif value > curr_node.value
        @parent = curr_node
        curr_node = curr_node.right
      end

    end

    #if get to the bottom of the tree and didn't find, return nil
    nil

  end

  def delete(value)
    #if target node is the root and root has no children
    if @root.value == value && @root.left.nil? && @root.right.nil?
      @root = nil
      return true
    end

    target_node = find(value, @root)

    if target_node.nil?
      return false
    #target node has no children
    elsif target_node.left.nil? && target_node.right.nil?
      delete_parent_child(@parent, target_node, value)

    #target node has only one child
    elsif target_node.left.nil? ^ target_node.right.nil?
      child_node = target_node.left || target_node.right
      delete_parent_child(@parent, target_node, value)

      if(child_node.value <= @parent.value)
        @parent.left = child_node
      else
        @parent.right = child_node
      end

    #target node has 2 children
    else
      max = maximum(target_node.left)
      target_node.value = max.value
      @parent.right = max.left
    end


  end

  def delete_parent_child(parent_node, target_node, value)
    if target_node == @parent.left
      @parent.left = nil
    else
      @parent.right = nil
    end
  end


  # helper method for #delete:
  def maximum(tree_node = @root)
    curr_node = tree_node
    until curr_node.right.nil?
      @parent = curr_node
      curr_node = curr_node.right
    end

    curr_node
  end

  def minimum(tree_node = @root)
    curr_node = tree_node
    until curr_node.left.nil?
      @parent = curr_node
      curr_node = curr_node.left
    end

    curr_node
  end

  def depth(tree_node = @root)
    #base cases
    if tree_node.nil?
      return 0
    end

    if tree_node.left.nil? && tree_node.right.nil?
      return 0
    end


    sum = 0
    if tree_node.left || tree_node.right
      sum += 1
    end

      left_depth = depth(tree_node.left)
      right_depth = depth(tree_node.right)

      actual_depth = 0

      if left_depth >= right_depth
        actual_depth = left_depth
      else
        actual_depth = right_depth
      end

      return sum + actual_depth
  end

#looks like they want balanced to be exact and not off by 1
  def is_balanced?(tree_node = @root)
    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)

    return left_depth == right_depth

  end

  def in_order_traversal(tree_node = @root, arr = [])
    #base case for when you hit the max value
    # return [tree_node.value] if tree_node.value == maximum(@root)
    return [] if tree_node.nil?
    return [tree_node.value] if tree_node.left.nil? && tree_node.right.nil?

    in_order_traversal(tree_node.left, arr) + [tree_node.value] + in_order_traversal(tree_node.right, arr)

  end
  # left arrs + self + right arrs
  #in_order_traversal the lefts + self + in_order_traversal the rights


  private
  # optional helper methods go here:

end
