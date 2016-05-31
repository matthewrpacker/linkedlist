require 'test_helper'

class LinkedListTest < Minitest::Test
  def setup
    @list = LinkedList.new
  end

  def test_initialize
    assert_nil @list.head
    assert_nil @list.tail
    assert_equal 0, @list.count
  end

  def test_append_single
    @list.append("doop")
    assert_equal "doop", @list.head.data
    assert_nil @list.head.next_node
    assert_equal 1, @list.count
  end

  def test_tail
    @list.append("doop")
    assert_equal "doop", @list.tail.data
    @list.append("bop")
    assert_equal "bop", @list.tail.data
    assert_nil @list.tail.next_node
  end

  def test_append_multiple
    @list.append("doop")
    @list.append("bop")
    assert_equal "doop", @list.head.data
    assert_equal "bop", @list.head.next_node.data
    assert_nil @list.head.next_node.next_node
    assert_equal 2, @list.count
  end

  def test_to_string_on_empty_list
    assert_equal "", @list.to_string
  end

  def test_to_string_on_list_with_one_node
    @list.append("doop")
    assert_equal "doop", @list.to_string
  end

  def test_to_string_on_list_with_three_nodes
    @list.append("doop")
    @list.append("bop")
    @list.append("beep")
    assert_equal "doop bop beep", @list.to_string
  end
end
