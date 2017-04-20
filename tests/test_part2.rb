require "test/unit"
require_relative '../lib/game'

class TestPart1 < Test::Unit::TestCase

  def setup
    @game = Game.new

  end

  def test_eucl_sq_dist
    assert_equal(Game.eucl_sq_distance([0, 0], [2, 2]), 8)
  end

  def test_catch_kudomon
    #additional setup
    kudomon_close= Sourbulb.new([20, 10], 200, 30)
    @game.add_kudomon(kudomon_close)
    kudomon_med= Sourbulb.new([40, 45], 200, 30)
    @game.add_kudomon(kudomon_med)
    kudomon_far= Sourbulb.new([90, 95], 200, 30)
    @game.add_kudomon(kudomon_far)
    trainer = Trainer.new(@game,  "Martin", [21, 11])
    @game.add_trainer(trainer);
    #finding closest Kukomon
    assert_equal(trainer.nearest_kudomon, kudomon_close, "Nearest Kudomon was not found")
    #catching closest kudomon
    trainer.catch_kudomon
    assert(!(@game.kudomons.include? kudomon_close), "Kudomon catching true positive failed")
    assert((@game.kudomons.include? kudomon_med), "Kudomon catching false positive failed")
    assert((@game.kudomons.include? kudomon_far), "Kudomon catching false positive failed")
  end

  def test_not_catch_kudomon
    trainer = Trainer.new(@game,  "Martin", [21, 11])
    @game.add_trainer(trainer);
    assert_equal(trainer.nearest_kudomon, nil)
    assert_raise(RuntimeError){trainer.catch_kudomon}
  end


end
