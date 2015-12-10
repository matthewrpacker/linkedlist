require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../list/linked_list'
require_relative '../list/node'
require_relative '../list/jungle_beat'

class LinkedListTest < Minitest::Test
  def test_tail
    list = LinkedList.new("bop")
    assert_equal "bop", list.tail.data
  end

  def test_append_a_list_of_one
    list = LinkedList.new("bop")
    list.append("deep")
    assert_equal "deep", list.tail.data
  end

  def test_append_a_list
    list = LinkedList.new("dee")
    list.append("deep")
    list.append("bop")
    assert_equal "bop", list.head.next_node.next_node.data
  end

  def test_prepend
    list = LinkedList.new("bop")
    list.prepend ("boop")
    assert_equal "boop", list.head.data
  end

  def test_head
    list = LinkedList.new("bop")
    assert_equal "bop", list.head.data
  end

  def test_count_nodes
    list = LinkedList.new("dee")
    list.append("deep")
    list.append("bop")
    assert_equal 3, list.count
  end

  def test_count_many_nodes
    list = LinkedList.new("bop")
    list.append("boop")
    list.append("bop")
    list.append("deep")
    list.append("bop")
    list.append("deep")
    list.append("bop")
    assert_equal 7, list.count
  end

  def test_if_list_includes_supplied_value
    list = LinkedList.new("bop")
    assert_equal true, list.include?("bop")
    list.append("boop")
    assert_equal true, list.include?("boop")
    assert_equal false, list.include?("bango")
  end

  def test_pop
    list = LinkedList.new("bop")
    list.append("deep")
    list.append("bop")
    list.append("boop")
    assert_equal 4, list.count
    list.pop(1)
    assert_equal 3, list.count
    assert_equal false, list.include?("boop")
  end

end

# def test_if_all_list_elements_are_returned
#   list = LinkedList.new("bo")
#   list.append("beep")
#   list.append("bop")
#   assert_equal "bo" "beep" "bop", list.all
# end

#   # def test_insert
#   # end

#   # def test_find
#   # end
