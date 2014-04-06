require_relative '../lib/queue.rb'
require 'minitest/autorun'

describe Queue do 
	before :each do
		@empty_queue = Queue.new
		@value1 = 1
		@value2 = 2
	end

	it ' allows insertion' do
		@empty_queue.insert(@value1)
		@empty_queue.front_node_value.must_equal @value1
		@empty_queue.size.must_equal 1
	end

	it ' responds to size' do
		@empty_queue.insert(@value1)
		@empty_queue.insert(@value2)
		@empty_queue.size.must_equal 2
	end

	it 'keeps track of last node when inserting' do
		@empty_queue.insert(@value1)
		@empty_queue.front_node_value.must_equal @value1
		@empty_queue.back_node_value.must_equal @value1
		@empty_queue.insert(@value2)
		@empty_queue.front_node_value.must_equal @value1
		@empty_queue.back_node_value.must_equal @value2
	end


	it 'respondes to empty?' do
		@empty_queue.empty?.must_equal true
		@empty_queue.insert(@value1)
		@empty_queue.empty?.must_equal false
	end



	it ' allows retrieval' do
		@empty_queue.insert(@value1)
		@empty_queue.insert(@value2)
		@empty_queue.leave.must_equal @value1
	end

	it ' allows retrieval and leaves an empty queue' do
		@empty_queue.insert(@value1)
		@empty_queue.leave.must_equal @value1
	end

	it ' responds to first' do
		@empty_queue.insert(@value1)
		@empty_queue.front_node_value.must_equal @value1				
	end

end