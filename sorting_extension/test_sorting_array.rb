require_relative "sorting_array.rb"
require "minitest/autorun"

describe Array do
	before :each do
		@max = 100
		@number_of_tests = @max / 3
		@array = [*0..@max].shuffle
	end

	it 'extends Array to bubble sort' do
		@sorted_array = @array.bubble_sort
		(@max / @number_of_tests).times do 
			i = rand(0..@max)
			@sorted_array[i].must_equal i
		end
	end

	it 'includes bubble sort in Eumerable' do
		@sorted_array = @array.bubble_sort_enumerable
		(@max / @number_of_tests).times do 
			i = rand(0..@max)
			@sorted_array[i].must_equal i
		end
	end
end