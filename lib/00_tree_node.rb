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

    @parent = node

    unless @parent.nil? || node.children.include?(self)
      #@parent.children.reject! {|el| el = value }
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
