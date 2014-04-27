require 'rubygems'
require 'minitest/autorun'
require 'minitest/benchmark'
require_relative 'sorting.rb'

describe ArraySorting do 
	before :each do
		@max = 100
		@number_of_tests = @max / 3
		@array = ArraySorting.new [*0..@max].shuffle
	end

	it 'bubble sorts trough arrays' do
		@sorted_array = @array.bubble_sort!
		(@max / @number_of_tests).times do 
			i = rand(0..@max)
			@sorted_array[i].must_equal i
		end
	end

	it 'selection sorts through arrays' do
		@sorted_array = @array.selection_sort!
		(@max / @number_of_tests).times do 
			i = rand(0..@max)
			@sorted_array[i].must_equal i
		end	
	end

	it 'does insertion sort' do
		@sorted_array = @array.insertion_sort!

		(@max / @number_of_tests).times do 
			i = rand(0..@max)
			@sorted_array[i].must_equal i
		end
	end

	it 'does shell sort' do
		@sorted_array = @array.shell_sort!

		(@max / @number_of_tests).times do 
			i = rand(0..@max)
			@sorted_array[i].must_equal i
		end
	end

	it 'does merge sort' do
		@sorted_array = @array.merge_sort!
		(@max / @number_of_tests).times do 
			i = rand(0..@max)
			@sorted_array[i].must_equal i
		end
	end

	it 'does quick sort' do
		@sorted_array = @array.quick_sort!
		(@max / @number_of_tests).times do 
			i = rand(0..@max)
			@sorted_array[i].must_equal i
		end
	end

	it ' benchmarks bubble sort' do
		validation = Proc.new {|range, time|}
		assert_performance validation do 
   	    	 @array.bubble_sort!
   		     @array.array = [*0..@max].shuffle
   		 end
	end


	it 'benchmarks merge sort' do
		validation = Proc.new {|range, time|}
		assert_performance validation do
   	    	 @array.quick_sort!
   		     @array.array = [*0..@max].shuffle
   		 end
	end


	it 'benchmarks quick sort' do
		validation = Proc.new {|range, time|}
		assert_performance validation do
   	    	 @array.quick_sort!
   		     @array.array = [*0..@max].shuffle
   		 end
	end

end

