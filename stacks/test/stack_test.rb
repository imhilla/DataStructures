require 'minitest/autorun'
require_relative '../lib/stack.rb'

describe LinkedStack do
	before :each do
		@empty_stack = LinkedStack.new
		@value1 = 1
		@value2 = 2
	end

	it 'responds correctly to empty?' do
		@empty_stack.empty?.must_equal true
		@empty_stack.push(@value1)
		@empty_stack.empty?.must_equal false
	end

	it 'pushes an element at the top of an empty stack' do
		@empty_stack.push(@value1)
		@empty_stack.top.must_equal @value1
	end

	it 'can return the size' do
	end

	it 'pushes an element at the top of a stack' do
		@empty_stack.push(@value1)
		@empty_stack.push(@value2)
		@empty_stack.top.must_equal @value2
	end	

	it ' returns the top element without deleting it from the stack' do
		@empty_stack.size.must_equal 0
		@empty_stack.push(@value1)
		@empty_stack.size.must_equal 1
	end

	it 'does not pop an empty stack' do
		@empty_stack.pop.must_equal false
	end

	it 'pops an element form the top, decreasing the size' do
		@empty_stack.push(@value1)
		@empty_stack.pop.must_equal @value1
		@empty_stack.size.must_equal 0
		@empty_stack.empty?.must_equal true
	end




	it 'can tell when it is empty?' do
	end



	
end
