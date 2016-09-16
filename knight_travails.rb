require_relative "../poly_tree_node/lib/00_tree_node"

class KnightPathFinder
  attr_accessor :visited_positions

  def initialize(pos)
    @start_pos = pos
  end

  def self.valid_moves(pos)
    x, y = pos
    return false unless (0..7).include?(x) && (0..7).include?(y)
    true
  end

  def new_move_positions(pos)
    possible_positions = []
    x, y = pos

    [-2, 2].each do |long|
      [-1, 1].each do |short|
        move = [x + long, y + short]
        possible_positions << move if KnightPathFinder.valid_moves(move)

        move = [x + short, y + long]
        possible_positions << move if KnightPathFinder.valid_moves(move)
      end
    end

    possible_positions
  end

  def build_move_tree
  end

  def find_path(end_pos)
  end

  def trace_path_back(node)
  end
end
