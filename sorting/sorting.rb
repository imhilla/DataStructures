require 'pry'

class ArraySorting
	attr_accessor :array

	def initialize array
		@array = array
	end

	def bubble_sort!
		(array.size-1).downto(1).each do |j|
			(1).upto(j).each do |i|
				if array[i] < array[i-1]
					array[i], array[i-1] = array[i-1], array[i]
				end
			end	
		end
		array
	end

	def selection_sort!
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

	def insertion_sort!
		insertion_sort(1)
	end


	def shell_sort!

		h = 1
		h = 3*h + 1 while h < array.size/9

		while h > 0 do
			insertion_sort(h)
			h /= 3
		end
		array
	end

	def insertion_sort(start)
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

end
