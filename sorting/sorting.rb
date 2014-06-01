require 'pry'

module Enumerable

	def bubble_sort
		array = self
		(array.size-1).downto(1).each do |j|
			(1).upto(j).each do |i|
				if array[i] < array[i-1]
					array[i], array[i-1] = array[i-1], array[i]
				end
			end	
		end
		array
	end

	def selection_sort
		array = self
		(array.size-1).downto(1).each do |j|
			max_index = j
			0.upto(j).each do |i|
				if array[i] > array[max_index]
					max_index = i
				end
			end
			array[max_index], array[j] = array[j], array[max_index]
		end
		array
	end

	def insertion_sort
		insert_sort(1)
	end

	def insert_sort(start)
		array = self
		start.upto(array.size-1).each do |j|
			inserting_value = array[j]
			shifting = false
			(start-1).upto(j-1).each do |i|
				if inserting_value < array[i] 
					if !shifting
						shifting = true
						@carry_on_value = array[i]
						array[i] = inserting_value
					else
						array[i], @carry_on_value = @carry_on_value, array[i]
					end
				end
			end
			if shifting
				array[j] = @carry_on_value
			end
		end
		array		
	end


	def shell_sort
		array = self
		h = 1
		h = 3*h + 1 while h < array.size/9
		while h > 0 do
			insert_sort(h)
			h /= 3
		end
		array
	end



	def merge_sort
		@array = merge_sort_recoursive(self)
		@array
	end


	def merge_sort_recoursive(a)
		return a if a.size == 1
		left_a, right_a = split_array(a)		
		left_a = merge_sort_recoursive(left_a)
		right_a = merge_sort_recoursive(right_a)
		combine(left_a, right_a)
	end


	def split_array(a)
		mid = (a.size / 2).round
		[a.take(mid), a.drop(mid)]
	end

	def combine(left_a, right_a)
		a = []
		while left_a.size > 0 && right_a.size > 0
			if left_a.first < right_a.first
				a << left_a.shift
			else
				a << right_a.shift
			end
		end
		if left_a.empty? && !right_a.empty?
			right_a.each {|i| a << i}
		elsif !left_a.empty? && right_a.empty?
			left_a.each {|i| a << i}
		end
		a
	end




	def quick_sort
		partition(self)
	end

	def partition(a)
		return a if a.size <= 1
		pivot = rand(0..(a.size-1))
		left = 0
		right = a.size - 1
		while left != pivot || right != pivot
			if a[left] < a[pivot]
				left += 1 unless left == pivot 
			else
				if a[right] > a[pivot]
					right -= 1 unless right == pivot
				else
					a[left], a[right] = a[right], a[left]
					if pivot == left
						pivot = right
						left += 1						
					elsif pivot == right
						pivot = left
						right -= 1
					else
						left += 1
						right -= 1
					end
				end
			end	
		end
		partition(a.take(pivot))+partition(a.drop(pivot))
	end


	def heapsort
		array = heapify
		i = array.length - 1
		while i > 0
			array[0], array[i] = array[i], array[0]
			array = check_heap(array.take(i)) + array.drop(i)
			i -= 1
		end
		array
	end

	def heapify
		array = self
		cursor_position = 1
		while cursor_position < array.length
			current_element = cursor_position
			parent_position = (current_element -1) / 2
			while parent_position >= 0
				if array[current_element] > array[parent_position]
					array[current_element], array[parent_position] = array[parent_position], array[current_element]
				end
				current_element = parent_position
				parent_position = (parent_position -1) / 2
			end
			cursor_position += 1
		end
		array
	end

	def check_heap array
		i = 0
		leaf1 = 1
		leaf2 = 2		
		while leaf1 < array.length && leaf2 < array.length
			if  array[leaf1] > array[i] && array[leaf1] > array[leaf2] 
				array[i], array[leaf1] = array[leaf1], array[i]
				i = leaf1
			elsif array[leaf2] > array[i] && array[leaf2] > array[leaf1]
				array[i], array[leaf2] = array[leaf2], array[i]
				i = leaf2
			else
				break
			end


			leaf1 = 2 * i + 1
			leaf2 = 2 * i + 2
		end
		if leaf1 < array.length
			if array[i] < array[leaf1]
				array[i], array[leaf1] = array[leaf1], array[i]
			end
		end
		array
	end

end

class Array
	include Enumerable
end

# a = [*0..10].shuffle

# pry

