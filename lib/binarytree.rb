class BinaryTree
attr_accessor :value, :left, :right
	def initialize(value, left = nil, right = nil)
		@value = value
		@left = left
		@right = right
		@order = []
	end

	def pre_order
		@order.push(self.value)
		@order.push(self.left.pre_order) if self.left 
		@order.push(self.right.pre_order) if self.right
		final = @order.flatten
		@order = []
		final
	end	

	def in_order
		@order.push(self.left.in_order) if self.left
		@order.push(self.value) 
		@order.push(self.right.in_order) if self.right
		final = @order.flatten
		@order = []
		final
	end	

	def post_order
		@order.push(self.left.post_order) if self.left 
		@order.push(self.right.post_order) if self.right
		@order.push(self.value)
		final = @order.flatten
		@order = []
		final
	end
end

tim = BinaryTree.new("Tim", BinaryTree.new("Jony"), BinaryTree.new("Phil"))
jony = tim.left
phil = tim.right
jony.left, jony.right = BinaryTree.new("Dan"), BinaryTree.new("Katie")
katie = jony.right
katie.left, katie.right = BinaryTree.new("Peter"), BinaryTree.new("Andrea")
phil.left, phil.right = BinaryTree.new("Craig"), BinaryTree.new("Eddie")
tim.pre_order
tim.in_order
tim.post_order