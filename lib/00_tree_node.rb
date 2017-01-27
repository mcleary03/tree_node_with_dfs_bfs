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

  def value
    @value
  end

  def inspect
    @value
  end
end
