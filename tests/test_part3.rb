require "test/unit"
require_relative '../lib/game'
require_relative '../lib/battle'

class TestPart3 < Test::Unit::TestCase

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
    kudomon_med= Sourbulb.new([40, 45], 100, 10)
    @game.add_kudomon(kudomon_med)
    kudomon_far= Sourbulb.new([90, 95], 400, 30)
    @game.add_kudomon(kudomon_far)

    trainer1 = Trainer.new(@game,  "Martin", [21, 11])
    @game.add_trainer(trainer1);
    trainer2 = Trainer.new(@game,  "Nora", [41, 45])
    @game.add_trainer(trainer2);
    trainer3 = Trainer.new(@game,  "Will", [90, 90])
    @game.add_trainer(trainer3);
    #finding closest Kukomon
    assert_equal(trainer1.nearest_kudomon, kudomon_close, "Nearest Kudomon was not found")
    #catching closest kudomon
    trainer1.catch_kudomon
    #finding closest Kukomon
    assert_equal(trainer2.nearest_kudomon, kudomon_med, "Nearest Kudomon was not found")
    #catching closest kudomon
    trainer2.catch_kudomon
    assert_equal(trainer3.nearest_kudomon, kudomon_far, "Nearest Kudomon was not found")
    #catching closest kudomon
    trainer3.catch_kudomon

    battle = Battle.new

    winner = battle.fight(trainer1, trainer2)
    assert_equal(winner, trainer1, "Battle logic went wrong")
    winner = battle.fight(trainer1, trainer3)
    assert_equal(winner, trainer3, "Battle logic went wrong")


  end



end
