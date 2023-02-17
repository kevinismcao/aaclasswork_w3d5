class PolyTreeNode
    attr_reader :parent, :children, :value
  
    def initialize (value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent= (parent_node)
        old_parent = self.parent
        @parent = parent_node
        if old_parent != nil
            old_parent.children.each_with_index do |child, idx|
                if child == self
                    old_parent.children.delete_at(idx)
                end
            end
        end

        if parent_node != nil 
            parent_node.children << self if !parent_node.children.include?(self)
        end
    end


    def inspect
        @value.inspect
    end
end