# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

require 'bst_node'

class BinarySearchTree
  attr_accessor :root

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
  ##this stuff belongs to insert but im just finding a more elegant way to do
  # #simply sets the root if it doesn't exist
  # #the base cases here
  # if @root.nil?
  #   @root = BSTNode.new(value)
  # elsif @root.left.nil? && value <= @root.value
  #   @root.left = BSTNode.new(value)
  # elsif @root.right.nil? && value > @root.value
  #   @root.right = BSTNode.new(value)
  # end
  #
  # #need to do some recursion here to add value
  # #or loop whatever feel me
  # inserted = false
  # current_node = @root
  #
  # until inserted
  #
  # end

  def find(value, tree_node = @root)
  end

  def delete(value)
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
