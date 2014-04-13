class Node
	attr_accessor :value, :next_node, :previous_node

	def initialize(args)
		@value 			= args[:value]
		@next_node 		= args[:next_node]		|| nil
		@previous_node 	= args[:previous_node]	|| nil
	end
end