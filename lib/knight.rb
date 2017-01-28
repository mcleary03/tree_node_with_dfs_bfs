require_relative "00_tree_node"

class KnightPathFinder

  def initialize(starting_pos = [0,0])
    @starting_pos = starting_pos
    build_move_tree
  end

  def build_move_tree
    @move_tree = PolyTreeNode.new(@starting_pos)
  end

end
