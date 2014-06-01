require 'minitest/autorun'
require 'minitest/benchmark'
require 'minitest/unit'

class TestArraySorting < Minitest::Benchmark
	def setup
		@max = 1000
		@array = ArraySorting.new [*0..@max].shuffle
	end

	def self.bench_range
	  bench_exp 100, 1_000_000
	end

	def bench_quick_sort
		validation = Proc.new {|range, time|}
		assert_performance validation do 
   	    	 @array.shell_sort!
   		     @array.array = [*0..@max].shuffle
   		 end
	end



end
