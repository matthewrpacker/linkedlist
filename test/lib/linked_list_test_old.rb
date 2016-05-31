require 'test_helper'

class LinkedListTest < Minitest::Test
  def setup
    @empty_list = LinkedList.new
    @list = LinkedList.new("beep boop bop")
  end

  def test_head_is_nil
    assert_nil LinkedList.new.head
  end

  def test_head
    assert_equal "beep", @list.head.data
  end

  def test_tail
    assert_equal "bop", @list.tail.data
  end

  def test_append_a_list_of_one
    @list.append("deep")
    assert_equal 4, @list.count
    assert_equal "deep", @list.tail.data
  end

  def test_append_a_list
    @list.append("deep bang dep")
    assert_equal 6, @list.count
    assert_equal "beep boop bop deep bang dep", @list.all
  end

  def test_prepend
    @list.prepend ("deep bang dep")
    assert_equal 6, @list.count
    assert_equal "deep bang dep beep boop bop", @list.all
  end

  def test_count_empty_list
    assert_equal 0, @empty_list.count
  end

  def test_count
    assert_equal 3, @list.count
  end

  def test_includes_empty_list
    assert_equal false, @empty_list.includes?("beep")
  end

  def test_includes
    assert_equal true, @list.includes?("beep")
    assert_equal true, @list.includes?("boop")
    assert_equal true, @list.includes?("bop")
    assert_equal false, @list.includes?("deep")
  end

  def test_pop
    assert_equal "boop bop", @list.pop(2)
    assert_equal 1, @list.count
    assert_equal "beep", @list.all
  end

  def test_pop_all
    assert_equal "beep boop bop", @list.pop(3)
    assert_equal 0, @list.count
  end

  def test_all_empty_list
    assert_equal "", @empty_list.all
  end

  def test_all
    assert_equal "beep boop bop", @list.all
  end

  def test_insert
    assert_equal "beep deep deep deep boop bop",
    @list.insert(1, "deep deep deep")
  end

  # def test_find
  #   list = LinkedList.new("beep bop boop deep bip dip doop")
  #   assert_equal "boop deep", list.find(3, 2)
  # end
end

# def test_if_all_list_elements_are_returned
#   list = LinkedList.new("bo")
#   list.append("beep")
#   list.append("bop")
#   assert_equal "bo" "beep" "bop", list.all
# end

#   # def test_find
#   # end
