require 'byebug'

class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def parent=(node)
    past_parent = @parent

    unless @parent.nil?
      past_parent.children.each.with_index do | child, i|
        past_parent.children.delete_at(i) if child == self
      end
    end

    @parent = node
    unless @parent.nil? || node.children.include?(self)
      node.children << self
    end
  end

  def children
    @children
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise if node.parent.nil?
    node.parent = nil
  end


  def value
    @value
  end

  def inspect
    @value
  end

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      success = child.dfs(target_value)
      return success if success
    end
    nil
  end

  def bfs(target_value) #shift => out,   push => in
    queue = [self]

    until queue.empty?
      current_node = queue.shift
      current_node.children.each { |child| queue << child }

      return current_node if current_node.value == target_value
    end
    nil
  end
end

# a = PolyTreeNode.new("a")
# b = PolyTreeNode.new("b")
# c = PolyTreeNode.new("c")
# d = PolyTreeNode.new("d")
# e = PolyTreeNode.new("e")
# f = PolyTreeNode.new("f")
# g = PolyTreeNode.new("g")
# b.parent = a
# c.parent = a
# d.parent = a
# e.parent = b
# f.parent = b
# g.parent = b
#
# a.dfs("f")
