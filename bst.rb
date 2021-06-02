class TreeNode
  attr_accessor :value, :left, :right

  def initialize(val)
    @value = val
    @left = nil
    @right = nil
  end
end

class BST
  attr_accessor :root

  def initialize()
    @root = nil
  end

  def insert(node = @root, value)
    if node == nil
      @root = TreeNode.new(value)
     # p node.value
      return 
    else  
        #p node.value
        if(value > node.value)
          if(node.right)
            insert(node.right, value)
          else
            node.right = TreeNode.new(value)
          end
        else
         if(node.left)
            insert(node.left,value)
         else
          node.left = TreeNode.new(value)
         end
        end 
        return node
    end
    
  end

  def largest
    curr_node = @root
    while curr_node.right != nil
      curr_node = curr_node.right
    end
    return curr_node.value
  end 

  def smallest
    curr_node = @root
    while curr_node.left != nil
      curr_node = curr_node.left
    end
    return curr_node.value
  end
 
  def inorder
   return inorder_rec(@root)
  end

 def inorder_rec(head)
  if head != nil
    inorder_rec(head.left)
    puts "#{head.value}"
    inorder_rec(head.right)
  end
 end

  def preorder
   return preorder_rec(root)
  end

  def preorder_rec(root)
    if root != nil
      puts "#{root.value}"
      preorder_rec(root.left)
      preorder_rec(root.right)
    end
  end

  def postorder
   return postorder_rec(root)
  end

  def postorder_rec(root)
    if root != nil
      postorder_rec(root.left)
      postorder_rec(root.right)
      puts "#{root.value}"
    end
  end

  def find(val)
    curr_node = @root
    while curr_node != nil
      if curr_node.value == val
        puts "#{val} is present"
        return
      elsif curr_node.value > val
        curr_node = curr_node.right
      else
        curr_node = curr_node.left
      end
      puts "#{val} is not present"
      return 
    end
  end

end

#a = gets.chomp.to_i
#b = gets.chomp.to_i
bst = BST.new
bst.insert(5)
bst.insert(4)
bst.insert(8)
bst.insert(12)
bst.insert(1)
bst.insert(7)
bst.insert(9)
#puts "#{bst.largest}"
bst.inorder
bst.find(9)

