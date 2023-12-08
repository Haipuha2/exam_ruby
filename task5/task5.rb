class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root, :size

  def initialize
    @root = nil
    @size = 0
  end

  def insert(value)
    @root = insert_recursive(@root, value)
    @size += 1
  end

  def find(value)
    find_recursive(@root, value)
  end

  def delete(value)
    @root = delete_recursive(@root, value)
    @size -= 1 if find(value)
  end

  def inorder_traversal
    inorder_traversal_recursive(@root)
  end

  def preorder_traversal
    preorder_traversal_recursive(@root)
  end

  def postorder_traversal
    postorder_traversal_recursive(@root)
  end

  private

  def insert_recursive(node, value)
    return TreeNode.new(value) if node.nil?

    if value < node.value
      node.left = insert_recursive(node.left, value)
    elsif value > node.value
      node.right = insert_recursive(node.right, value)
    end

    node
  end

  def find_recursive(node, value)
    return false if node.nil?

    if value == node.value
      true
    elsif value < node.value
      find_recursive(node.left, value)
    else
      find_recursive(node.right, value)
    end
  end

  def delete_recursive(node, value)
    return nil if node.nil?

    if value < node.value
      node.left = delete_recursive(node.left, value)
    elsif value > node.value
      node.right = delete_recursive(node.right, value)
    else
      if node.left.nil?
        return node.right
      elsif node.right.nil?
        return node.left
      end

      node.value = find_min(node.right).value
      node.right = delete_recursive(node.right, node.value)
    end

    node
  end

  def find_min(node)
    current = node
    current = current.left until current.left.nil?
    current
  end

  def inorder_traversal_recursive(node)
    return [] if node.nil?

    result = []
    result.concat(inorder_traversal_recursive(node.left))
    result << node.value
    result.concat(inorder_traversal_recursive(node.right))
    result
  end

  def preorder_traversal_recursive(node)
    return [] if node.nil?

    result = []
    result << node.value
    result.concat(preorder_traversal_recursive(node.left))
    result.concat(preorder_traversal_recursive(node.right))
    result
  end

  def postorder_traversal_recursive(node)
    return [] if node.nil?

    result = []
    result.concat(postorder_traversal_recursive(node.left))
    result.concat(postorder_traversal_recursive(node.right))
    result << node.value
    result
  end
end

# Приклад використання:
binary_tree = BinaryTree.new
binary_tree.insert(5)
binary_tree.insert(3)
binary_tree.insert(7)
binary_tree.insert(2)
binary_tree.insert(4)
binary_tree.insert(6)
binary_tree.insert(8)

puts "Inorder Traversal: #{binary_tree.inorder_traversal}"
puts "Preorder Traversal: #{binary_tree.preorder_traversal}"
puts "Postorder Traversal: #{binary_tree.postorder_traversal}"

puts "Size of the tree: #{binary_tree.size}"

value_to_find = 6
puts "Is #{value_to_find} present in the tree? #{binary_tree.find(value_to_find)}"

value_to_delete = 3
puts "Deleting #{value_to_delete} from the tree."
binary_tree.delete(value_to_delete)

puts "Inorder Traversal after deletion: #{binary_tree.inorder_traversal}"
puts "Size of the tree after deletion: #{binary_tree.size}"
