require 'minitest/autorun'
require_relative 'sorting.rb'

describe ArraySorting do 
	before :each do

		@array = ArraySorting.new [5,4,3,2,1]
	end

	it 'bubble sorts trough arrays' do
		@sorted_array = @array.bubble_sort
		@sorted_array[0].must_equal 1
		@sorted_array[4].must_equal 5
	end

	it 'selection sorts through arrays' do
		@sorted_array = @array.selection_sort
		@sorted_array[0].must_equal 1
		@sorted_array[4].must_equal 5		
	end

end

