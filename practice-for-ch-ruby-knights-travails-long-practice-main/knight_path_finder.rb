require_relative "tree_node"
class KnightPathFinder

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
    end

    def self.valid_moves(pos) #8 possible moves
        x, y = pos
        possible_moves = []
        [-2, -1, 1, 2].each do |i|
            [-2, -1, 1, 2].each do |j|
                possible_moves << [x+i, y+j] if i.abs != j.abs
            end
        end
        possible_moves
    end

    def build_move_tree #use new_move_pos, build in breadth first manner

    end

    def new_move_positions(pos) #call ::valid_moves method
        
    end
end
