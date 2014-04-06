require_relative 'node.rb'

class Queue

 attr_accessor :front_node, :back_node, :size 
	
	def initialize
		@back_node = nil
		@front_node = nil
		@size = 0
	end

	def insert value
		insert_node(value)
	end

	def front_node_value
		front_node.value
	end

	def back_node_value
		back_node.value
	end

	def empty?
		is_queue_empty?
	end

	def leave
		pop_front_node
	end



	private

	def insert_node value
		new_back_node = Node.new(value)
		update_back_node(new_back_node)
		increase_size
	end

	def update_front_node(node)
		node.next_node = front_node
		front_node = node
	end

	def update_back_node(node)
		if is_first_node?
			@front_node = node
		else
			@back_node.next_node = node
		end	
		@back_node = node
	end

	def pop_front_node
		popped_value = front_node.value
		decrease_size
		unless is_queue_empty?
			new_front_node = front_node.next_node
			update_front_node(new_front_node)
		end
		popped_value
	end

	def increase_size
		@size = size + 1
	end

	def decrease_size
		@size = size - 1
	end

	def is_queue_empty?
		if size == 0
			true
		else
			false
		end
	end

	def is_first_node?
		is_queue_empty?
	end

end