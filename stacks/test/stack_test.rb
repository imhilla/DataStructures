require 'minitest/autorun'
require_relative '../lib/stack.rb'

describe LinkedStack do
	before :each do
		@stack = LinkedStack.new
		@value1 = 1
	end


	it 'pushes an element at the top increasing the size' do
		@stack.push(@value1)
		@stack.top.must_equal @value1
	end

	it ' returns the top element without deleting it from the stack' do
	end

	it 'pops an element form the top, decreasing the size' do
	end

	it 'can tell when it is empty?' do
	end


	it 'can return the size' do
	end
	
end
