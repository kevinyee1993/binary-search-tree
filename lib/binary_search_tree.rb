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
    elsif target_node.left.nil? && target_node.right.nil?
      if target_node == @parent.left
        @parent.left = nil
      else
        @parent.right = nil
      end
    end




    # elsif @root.value == value && @root.left.nil? || @root.right.nil?
    #   promoted_root = @root.left
    #   promoted_root ||= @root.right
    #
    #   @root = promoted_root
    # end


  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

end
