require "test/unit"
require_relative '../lib/game'

class TestPart1 < Test::Unit::TestCase

  def setup
    @game = Game.new
  end

  def test_creation_kudomon_default
    kudomon= Sourbulb.new
    @game.add_kudomon(kudomon);
    assert((@game.kudomons.include? kudomon), "Kudomon creation with default parameters failed")
  end

  def test_creation_kudomon_custom
    kudomon= Sourbulb.new([20, 10], 200, 30)
    @game.add_kudomon(kudomon)
    assert((@game.kudomons.include? kudomon), "Kudomon creation with custom parameters failed")
    assert_equal(kudomon.position, [20, 10], "Kudomon creation with custom position failed")
    assert_equal(kudomon.hp, 200, "Kudomon creation with custom hp failed")
    assert_equal(kudomon.cp, 30, "Kudomon creation with custom cp failed")
  end

  def test_creation_trainer_default
    trainer = Trainer.new(@game, "Martin")
    @game.add_trainer(trainer);
    assert((@game.trainers.include? trainer), "Player creation with default parameters failed")
  end

  def test_creation_trainer_custom
    trainer = Trainer.new(@game,  "Nora", [40, 50])
    @game.add_trainer(trainer);
    assert((@game.trainers.include? trainer), "Player creation with custom parameters failed")
    assert_equal(trainer.name, "Nora", "Player creation with custom name failed")
    assert_equal(trainer.position, [40, 50], "Kudomon creation with position hp failed")
  end

  def test_wrong_kudomon_type
    trainer = Trainer.new(@game, "Nora", [60, 50])
    assert_raise(RuntimeError){@game.add_kudomon(trainer)}
  end

  def test_wrong_trainer_type
    kudomon= Sourbulb.new
    assert_raise(RuntimeError){@game.add_trainer(kudomon)}
  end

end
