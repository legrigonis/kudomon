require "test/unit"
require_relative '../lib/game'

class TestPart1 < Test::Unit::TestCase

  def setup
    @game = Game.new

  end

  def test_eucl_sq_dist
    assert_equal(Game.eucl_sq_distance([0, 0], [2, 2]), 8)
  end


end
