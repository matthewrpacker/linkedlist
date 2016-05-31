require 'test_helper'

class NodeTest < Minitest::Test
  def setup
    @node = Node.new("plop")
  end

  def test_initialize_data_only
    assert_equal "plop", @node.data
    assert_nil @node.next_node
  end

  def test_next_node
    head = Node.new("toss", @node)
    assert_equal "toss", head.data
    assert_same @node, head.next_node
  end
end
