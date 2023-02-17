class PolyTreeNode
    attr_reader :parent, :children, :value
  
    def initialize (value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent= (parent_node)
        if parent_node == nil 
            
        @parent = parent_node
        parent_node.children << self if !parent_node.children.include?(self)

    end


    def inspect
        @value.inspect
    end
end