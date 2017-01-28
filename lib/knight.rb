require_relative "00_tree_node"

class KnightPathFinder

  MOVEMENT_SHIFTS = [
    [2,1],   # u2 r1
    [2,-1],  # u2 l1
    [-2,1],  # d2 r1
    [-2,-1], # d2 l1
    [-1,2],  # d1 r2
    [-1,2],  # d1 l2
    [1,2],   # u1 r2
    [1,-2]  # u1 l2
  ]

  def initialize(starting_pos = [0,0])
    @starting_pos = starting_pos
    @visited_positions = [starting_pos]
    build_move_tree
  end

  def build_move_tree
    @move_tree = PolyTreeNode.new(@starting_pos)
  end

  def self.valid_moves(pos)
    MOVEMENT_SHIFTS.map do |coordinate|
      [coordinate[0] + pos[0], coordinate[1] + pos[1]]
    end
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos) - @visited_positions
  end
end

x = KnightPathFinder.new
p x.new_move_positions([3,3])
