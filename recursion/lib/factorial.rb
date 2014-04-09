require_relative '../../stacks/lib/stack.rb'



class FactorialsTry
	attr_accessor :num
	def initialize num
		@num = num
	end

	def factorial_recursive
		factorial_rec(@num)
	end

	def factorial_stack
		factorial_stk(@num)
	end

	private

	def factorial_rec number
		if number == 0
			1
		else
			number*factorial_rec(number-1)
		end
	end


	def factorial_stk number
		stack = LinkedStack.new
		stack.push(number)

		(number-1).downto(1) do |num|
			a = stack.pop
			stack.push(a*num)
		end
		stack.pop
	end
end