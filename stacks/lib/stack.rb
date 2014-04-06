require_relative 'node.rb'

class LinkedStack
	attr_accessor :size, :top_node

	def initialize(*initial_nodes)
		@size = 0
		@top_node = nil
		initialize_nodes(initial_nodes)
	end

	def push(value)
		create_top_node(value)
	end

	def top
		top_node_value
	end

	def pop
		if empty?
			false
		else
			remove_top_value
		end
	end

	def empty?
		stack_empty?
	end

#per POODR, only the methods above are interface, the rest below is not
	private

	def create_top_node(value)
		new_top_node = Node.new(value,top_node)
		update_top_node(new_top_node)
		increase_size
	end

	def update_top_node(node)
		@top_node = node
	end

	def top_node_value
		top_node.value
	end

	def remove_top_value
		old_top_node = top_node
		new_top_node = top_node.next_node
		update_top_node(new_top_node)
		decrease_size
		return old_top_node.value
	end

	def increase_size
		@size = size + 1
	end

	def decrease_size
		@size = size - 1
	end

	def stack_empty?
		if size == 0
			true
		else
			false
		end
	end

	def initialize_nodes values
		values.each do |value|
			create_top_node(value)
		end
	end

end

