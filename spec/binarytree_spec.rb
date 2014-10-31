require 'binarytree'
require 'minitest/autorun'
require 'minitest/spec'

describe BinaryTree do
	before do
		@team = BinaryTree.new("Tim", BinaryTree.new("Jony"), BinaryTree.new("Phil"))
		jony = @team.left
		phil = @team.right
		jony.left, jony.right = BinaryTree.new("Dan"), BinaryTree.new("Katie")
		katie = jony.right
		katie.left, katie.right = BinaryTree.new("Peter"), BinaryTree.new("Andrea")
		phil.left, phil.right = BinaryTree.new("Craig"), BinaryTree.new("Eddie")
	end

	it 'should pre_order' do
		@team.pre_order.must_equal ["Tim", "Jony", "Dan", "Katie", "Peter", "Andrea", "Phil", "Craig", "Eddie"]
	end

	it 'should in_order' do
		@team.in_order.must_equal ["Dan", "Jony", "Peter", "Katie", "Andrea", "Tim", "Craig", "Phil", "Eddie"] 
	end

	it 'should post_order' do
		@team.post_order.must_equal ["Dan", "Peter", "Andrea", "Katie", "Jony", "Craig", "Eddie", "Phil", "Tim"]
	end
end