require_relative "../poly_tree_node/lib/00_tree_node"

class KnightPathFinder
  attr_accessor :visited_positions

  def initialize(pos)
    @start_pos = pos
  end

  def self.valid_moves(pos)
  end

  def new_move_positions
  end

  def build_move_tree
  end

  def find_path(end_pos)
  end

  def trace_path_back(node)
  end
end
