require_relative "tree_node.rb"
require "byebug"
class KnightPathFinder
    attr_reader :considered_positions, :root_node

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
    end

    def self.valid_moves(pos) #8 possible moves
        x, y = pos
        possible_moves = []
        [-2, -1, 1, 2].each do |i|
            [-2, -1, 1, 2].each do |j|
                if i.abs != j.abs && ((x+i) >=0 && (x+i) <= 8) && ((y+j) >= 0 && (y+j) <= 8)
                    possible_moves << [x+i, y+j]
                end 
            end
        end
        possible_moves
    end

    def build_move_tree #use new_move_pos, build in breadth first manner
        queue = [@root_node]
        until queue.empty?
            node = queue.shift 
            children_pos = self.new_move_positions(node.position)
            children_pos.each do |childpos|
                node.add_child(PolyTreeNode.new(childpos))  
            end
            queue.concat(node.children)
        end
        nil
    end


    #     def bfs(target_value)
    #         queue = [self]
    #         until queue.empty?
    #             node = queue.shift 
    #             return node if node.value == target_value
    #             queue.concat(node.children)
    #         end
    #         nil
    #     end

    def new_move_positions(pos) #call ::valid_moves method
        vali_move = KnightPathFinder.valid_moves(pos).dup
        new_move = vali_move.select {|pos| !@considered_positions.include?(pos)}
        @considered_positions += new_move
        new_move
    end
end
