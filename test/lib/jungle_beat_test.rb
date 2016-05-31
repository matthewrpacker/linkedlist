require 'test_helper'

class JungleBeatTest < Minitest::Test

  def setup
    @jungle_beat = JungleBeat.new
  end

  def test_junglebeat_has_a_list
    refute_nil @jungle_beat.list
  end

  # def test_append_a_list
  #   @jungle_beat.append("deep bang dep")
  #   assert_equal 3, @jungle_beat.count
  #   assert_equal "deep bang dep", @jungle_beat.all
  # end
end
