require 'pry'

class ArraySorting
	attr_accessor :array

	def initialize array
		@array = array
	end

	def bubble_sort
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

end
