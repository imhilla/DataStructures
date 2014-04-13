require 'pry'
require_relative 'node.rb'

class LinkedList
	attr_accessor :head, :tail, :size, :cursor_index, :cursor_node

	def initialize
		@size	= 0
		@head	= default_node
		@tail	= head
	end

	def empty?
		is_empty?
	end

	def add(args)
		value = args[:value]
		index = args[:index]
		add_value_at_index(value, index)
	end

	def value_at(index)
		retrieve_value_at(index)
	end

	def delete_at(index)
		delete_value_at_location(index)
	end

	def first_occurrence_of(value)
		retrieve_first_index_of(value)
	end

	def is_equal_to?(list)
		compare_with_list(list)
	end

	private

	def default_node
		Node.new(value: nil)
	end

	def add_value_at_index(value, index)
		if is_empty?
			add_value_to_empty(value,index)
		elsif index_beyond_end?(index)
			add_value_beyond_tail(value,index)
		else
			add_value_in_list(value,index)
		end		
	end

	def add_value_to_empty(value,index)
		unless index == 0 
			previous_node = head
			increase_size
			(index-1).times do |i|
				current_node = add_node(value: nil, previous_node: previous_node, next_node: nil)
				previous_node.next_node = current_node
				previous_node = current_node
				increase_size
			end
			@tail = add_node(	value: value,
									previous_node: previous_node, 
									next_node: nil)
			previous_node.next_node = tail
			increase_size
		else
			head.value = value
			increase_size
			tail = head
		end
		update_cursor(node: tail,index: index)
	end

#add value beyond tail and add value to empty needs to be refactored together
	def add_value_beyond_tail(value,index)
		previous_node = tail		
		(index-size).times do
			current_node = add_node(value: nil,previous_node: previous_node, next_node: nil)
			previous_node.next_node = current_node
			previous_node = current_node
			increase_size
		end
		@tail = add_node(	value: value,
								previous_node: previous_node, 
								next_node: nil)
		previous_node.next_node = tail
		increase_size		
		update_cursor(node: tail,index: index)
	end


	def add_value_in_list(value,index)
		node = retrieve_node_at(index)
		node.value = value
		update_cursor(node: node,index: index)			
	end


	def add_node(args)
		Node.new(	value: args[:value],
					next_node: args[:next_node],
					previous_node: args[:previous_node])
	end

	def retrieve_value_at(index)
		retrieve_node_at(index).value
	end

	def retrieve_node_at(index)
		if search_out_of_bounds?(index)
			false
		else
			if closer_to_head?(index)
				search_from_head(index)
			elsif closer_to_tail?(index)
				search_from_tail(index)
			else
				search_from_cursor(index)
			end
		end
	end

	def closer_to_head?(index)
		if index <= (cursor_index/2)
			true
		else
			false
		end
	end

	def closer_to_tail?(index)
		if index >= (size-cursor_index/2) 
			true
		else
			false
		end
	end

	def search_from_head(index)
		current_node = head
		index.times do |i|
			current_node = current_node.next_node
		end	
		update_cursor(node: current_node,index: index)			
		current_node
	end

	def search_from_tail(index)
		current_node = tail
		(size-1-index).times do |i|
			current_node = current_node.previous_node
		end	
		update_cursor(node: current_node, index: index)			
		current_node
	end

#there is a duplication of searchign up and down
#refactor to make DRY
	def search_from_cursor(index)
		if index == cursor_index
			cursor_node
		elsif index > cursor_index
			current_node = cursor_node
			(index-cursor_index).times do |i|
				current_node = current_node.next_node
			end	
			update_cursor(node: current_node, index: index)			
			current_node			
		else
			current_node = cursor_node
			(index-cursor_index).times do |i|
				current_node = current_node.previous_node
			end	
			update_cursor(node: current_node, index: index)			
			current_node
		end		
	end

	def delete_value_at_location(index)
		search_out_of_bounds?(index)
		retrieve_node_at(index).value = nil
		if index == (size-1)
			update_tail_to_second_to_last
		end		
	end

	def update_tail_to_second_to_last
		last_valid_element = tail
		for i in 1..size
			last_valid_element = last_valid_element.previous_node
			decrease_size		
			if last_valid_element.value != nil
				break
			end
		end
		last_valid_element.next_node = nil
		tail = last_valid_element
		update_cursor(value: tail.value,index: (size-1))
	end

	def retrieve_first_index_of(value)
		current_node = head
		index = false
		for i in 0..(size-1)
			if current_node.value == value
				index = i
				break
			end
			current_node = current_node.next_node
		end
		index
	end




	def search_out_of_bounds?(index)
		if index > (size-1)
			raise IndexError,"this #{self.class} does not have #{index+1} elements" 
		else
			false
		end
	end


	def increase_size
		@size = size + 1
	end

	def decrease_size
		@size = size - 1
	end

	def is_empty?
		if size > 0
			false
		else
			true
		end
	end

	def index_beyond_end?(index)
		if index >= size 
			true
		else
			false
		end
	end

	def update_cursor(args)
		@cursor_index = args[:index]
		@cursor_node = args[:node]
	end

	def compare_with_list(list)
		unless is_a_list?(list)
			raise ArgumentError, "The argument given is not a #{self.class}"
		end

		if !preliminary_comparison(list)
			false
		else
			full_comparison(list)
		end
	end
	
	def is_a_list?(list)
		list.class == self.class
	end

	def preliminary_comparison(list)
		if list.size != size
			false
		elsif list.head.value != head.value
			 false
		elsif list.tail.value != tail.value
			 false
		else
			true
		end
	end

	def full_comparison(list)
		status = true
		current_node = head
		other_current_node = list.head
		for i in 0..(size-1)
			if current_node.value != other_current_node.value
				status = false
				break
			end
			current_node = current_node.next_node
			other_current_node = other_current_node.next_node
		end
		status
	end


end

