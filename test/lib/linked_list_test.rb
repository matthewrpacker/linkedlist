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

  def test_append_to_empty_list
    return_value = @list.append("doop")
    assert_equal "doop", @list.head.data
    assert_nil @list.head.next_node
    assert_equal 1, @list.count
    assert_equal "doop", return_value
  end

  def test_tail
    @list.append("doop")
    assert_equal "doop", @list.tail.data
    @list.append("bop")
    assert_equal "bop", @list.tail.data
    assert_nil @list.tail.next_node
  end

  def test_to_string_on_empty_list
    assert_empty @list.to_string
  end

  def test_to_string_on_list_with_one_node
    @list.append("doop")
    assert_equal "doop", @list.to_string
  end

  def test_append_and_to_string
    @list.append("doop")
    @list.append("bop")
    @list.append("beep")
    assert_equal "doop bop beep", @list.to_string
    assert_equal 3, @list.count
  end

  def test_prepend_data_to_empty_list
    return_value = @list.prepend("doop")
    assert_equal "doop", @list.head.data
    assert_equal 1, @list.count
    assert_equal "doop", return_value
  end

  def test_prepend_data_to_head_of_list
    @list.prepend("beep")
    @list.prepend("bop")
    return_value = @list.prepend("doop")
    assert_equal "doop bop beep", @list.to_string
    assert_equal 3, @list.count
    assert_equal "doop", return_value
  end

  def test_insert_into_empty_list
    return_value = @list.insert(0, "doop")
    assert_equal "doop", @list.head.data
    assert_equal 1, @list.count
    assert_equal "doop", return_value
  end

  def test_insert_into_middle_of_list
    @list.append("doop")
    @list.append("beep")
    @list.insert(1, "bop")
    assert_equal "doop bop beep", @list.to_string
    assert_equal 3, @list.count
    @list.append("boop")
    @list.append("dip")
    return_value = @list.insert(3, "doo")
    assert_equal "doop bop beep doo boop dip", @list.to_string
    assert_equal 6, @list.count
    assert_equal "doo", return_value
  end

  def test_insert_into_list_of_one
    @list.append("doop")
    @list.insert(1, "bop")
    assert_equal "doop bop", @list.to_string
  end

  def test_insert_into_head_of_list
    @list.append("doop")
    @list.append("beep")
    @list.insert(0, "bop")
    assert_equal "bop doop beep", @list.to_string
  end

  def test_find_on_empty_list
    assert_empty @list.find(1, 2)
  end

  def test_find
    @list.append("doop")
    @list.append("beep")
    @list.append("bop")
    @list.append("boop")
    @list.append("deep")
    assert_equal "beep bop boop", @list.find(1, 3)
  end

  def test_pop_empty_list
    assert_empty @list.pop
  end

  def test_pop_list_of_one
    @list.append("doop")
    assert_equal "doop", @list.pop
    assert_empty @list
  end

  def test_pop
    @list.append("doop")
    @list.append("beep")
    @list.append("bop")
    @list.append("boop")
    @list.append("deep")
    assert_equal "deep", @list.pop
    assert_equal "doop beep bop boop", @list.to_string
    @list.pop
    @list.pop
    assert_equal "doop beep", @list.to_string
  end

  def test_includes?
    refute @list.includes?("doop")
    @list.append("doop")
    @list.append("beep")
    @list.append("bop")
    @list.append("boop")
    @list.append("deep")
    assert @list.includes?("doop")
    refute @list.includes?("bing")
    @list.append("bing")
    assert @list.includes?("bing")
  end
end
