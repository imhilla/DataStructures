require 'minitest/autorun'
require_relative '../lib/factorial.rb'

describe FactorialsTry do 
	before :each do
		@factorial = FactorialsTry.new(4)
	end

	it 'implements recursive factorial correctly' do
		@factorial.factorial_recursive.must_equal 24


	end
	
end