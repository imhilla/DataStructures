require 'minitest/autorun'
require_relative '../lib/list.rb'

describe LinkedList do
	before :each do
		@list = LinkedList.new
	end

	it 'responds to empty?' do
		@list.empty?.must_equal true
	end

	it 'responds to add' do
		@list.add(value: 27, index: 4)
		@list.value_at(0).must_equal nil
		@list.value_at(4).must_equal 27
		@list.size.must_equal 5
	end

	it 'responds to add to first location from empty list' do
		@list.add(value: 27, index: 0)
		@list.size.must_equal 1
		@list.value_at(0).must_equal 27
	end

	it 'does not allow search out of bounds  from empty list' do
		@list.add(value: 27, index: 0)
		err = proc {@list.value_at(8)}.must_raise IndexError
		err.message.must_match /this LinkedList does not have \d{1,3} elements/
	end

	it "allows adding to existing list" do
		@list.add(value: 27, index: 4)
		@list.add(value: 28, index: 0)
		@list.size.must_equal 5
		@list.value_at(0).must_equal 28
		@list.value_at(3).must_equal nil		
		@list.value_at(4).must_equal 27
		@list.size.must_equal 5		
	end

	it "correctly returns values at mid, end or start" do
		@list.add(value: 0, index: 0)
		@list.add(value: 1, index: 1)
		@list.add(value: 3, index: 3)
		@list.add(value: 5, index: 5)
		@list.add(value: 6, index: 6)
		@list.value_at(0).must_equal 0
		@list.value_at(1).must_equal 1
		@list.value_at(3).must_equal 3
		@list.value_at(5).must_equal 5
		@list.value_at(6).must_equal 6
		@list.value_at(4).must_equal nil
	end

	it "allows adding to existing list beyond boundary" do
		@list.add(value: 28, index: 0)
		@list.add(value: 27, index: 10)
		@list.size.must_equal 11
		@list.value_at(0).must_equal 28
		@list.value_at(10).must_equal 27
	end

	
	it 'responds to delete at a certain place' do
		@list.add(value: 28, index: 0)
		@list.add(value: 27, index: 10)
		@list.delete_at(0)
		@list.value_at(0).must_equal nil
		@list.size.must_equal 11		
	end

	it 'responds to delete the last location' do
		@list.add(value: 28, index: 0)
		@list.add(value: 27, index: 10)
		@list.delete_at(10)
		@list.value_at(0).must_equal 28
		@list.size.must_equal 1		
	end

	it 'correctly updates tail and head' do
		@list.add(value: 28, index: 0)
		@list.add(value: 29, index: 5)		
		@list.add(value: 27, index: 10)
		@list.tail.value.must_equal 27
		@list.head.value.must_equal 28
	end

	it 'updates elements' do
		@list.add(value: 29, index: 5)		
		@list.add(value: 27, index: 10)
		@list.add(value: 28, index: 5)
		@list.value_at(5).must_equal 28		
	end


	it 'responds to replace value at last position' do
		@list.add(value: 28, index: 0)
		@list.add(value: 29, index: 5)
		@list.size.must_equal 6		
		@list.add(value: 27, index: 5)
		@list.value_at(5).must_equal 27
	end

	# update the search to use the cursor and head and tail

	it 'responds to index of certain element' do
		@list.add(value: 28, index: 0)
		@list.add(value: 27, index: 2)
		@list.add(value: 27, index: 4)
		@list.add(value: 27, index: 10)
		@list.value_at(2).must_equal 27
		@list.first_occurrence_of(27).must_equal 2
		@list.first_occurrence_of(32).must_equal false
	end	

	it 'responds to equality among lists' do
		@list.add(value: 28, index: 0)
		@list.add(value: 27, index: 2)
		@list.add(value: 27, index: 4)
		@list.add(value: 27, index: 10)
		@equal_list = LinkedList.new
		@equal_list.add(value: 28, index: 0)
		@equal_list.add(value: 27, index: 2)
		@equal_list.add(value: 27, index: 4)
		@equal_list.add(value: 27, index: 10)		
		@different_list = LinkedList.new
		@different_list.add(value: 28, index: 0)
		@different_list.add(value: 27, index: 2)
		@different_list.add(value: 27, index: 4)
		@different_list.add(value: 27, index: 10)		
		@different_list.add(value: 29, index: 4)
		@list.is_equal_to?(@equal_list).must_equal true
		@list.is_equal_to?(@different_list).must_equal false
	end	


end