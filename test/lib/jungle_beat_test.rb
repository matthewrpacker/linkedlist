require 'test_helper'

class JungleBeatTest < Minitest::Test
  def setup
    @jungle_beat = JungleBeat.new
  end

  def test_junglebeat_has_a_list
    refute_nil @jungle_beat.list
  end

  def test_list_head_is_nil
    assert_equal nil, @jungle_beat.list.head
  end

  def test_append_many_nodes
    assert_equal "deep doo ditt", @jungle_beat.append("deep doo ditt")
  end

  def test_what_is_appended_to_jungle_beat_is_appened_to_list
    @jungle_beat.append("deep doo ditt")
    assert_equal "deep", @jungle_beat.list.head.data
    assert_equal "doo", @jungle_beat.list.head.next_node.data
  end

  def test_count_nodes_appended
    @jungle_beat.append("deep doo ditt")
    assert_equal 3, @jungle_beat.count
    @jungle_beat.append("woo hoo shu")
    assert_equal 6, @jungle_beat.count
  end

  def test_we_can_play_list_beats_from_jungle_beat
    @jungle_beat.append("bing bop boop bing bop boop bing bop boop")
    assert_equal 9, @jungle_beat.play
  end

  def test_attr_accessor_rate
    @jungle_beat.rate = 100
    assert_equal 100, @jungle_beat.rate
  end

  def test_attr_accessor_voice
    @jungle_beat.voice = 'Alice'
    assert_equal 'Alice', @jungle_beat.voice
  end

  def test_reset_rate
    @jungle_beat.rate = 100
    assert_equal 500, @jungle_beat.reset_rate
    assert_equal 500, @jungle_beat.rate
  end

  def test_reset_voice
    @jungle_beat.voice = 'Alice'
    assert_equal 'Boing', @jungle_beat.reset_voice
    assert_equal 'Boing', @jungle_beat.voice
  end
end
