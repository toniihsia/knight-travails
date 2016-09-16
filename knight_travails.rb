require_relative "../poly_tree_node/lib/00_tree_node"
require 'set'

class KnightPathFinder
  attr_accessor :visited_positions

  def initialize(pos)
    @start_pos = pos
    @visited_positions = Set.new
  end

  def self.valid_move?(pos)
    x, y = pos
    return false unless (0..7).include?(x) && (0..7).include?(y)
    true
  end

  def possible_positions(pos)
    positions = []
    x, y = pos

    [-2, 2].each do |long|
      [-1, 1].each do |short|
        move = [x + long, y + short]
        positions << move if KnightPathFinder.valid_move?(move)

        move = [x + short, y + long]
        positions << move if KnightPathFinder.valid_move?(move)
      end
    end

    positions
  end


  def find_path(end_pos)
    build_move_tree
    end_node = @root.dfs(end_pos)
    path = trace_path_back(end_node)
  end

  def trace_path_back(node)
    path = []

    until node.nil?
      path << node.value
      node = node.parent
    end

    path.reverse
  end

  private

  def build_move_tree
    @root = PolyTreeNode.new(@start_pos)
    queue = [@root]

    until queue.empty?
      current = queue.shift
      current_pos = current.value

      @visited_positions << current_pos
      possible_positions(current_pos).each do |position|
        unless @visited_positions.include?(position)
          child = PolyTreeNode.new(position)
          current.add_child(child)
          queue << child
        end
      end
    end
  end



end
