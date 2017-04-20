require_relative './kudomon'
require_relative './kudomons/sourbulb'
require_relative './trainer'

class Game

  attr_accessor :kudomons, :trainers

  def initialize(grid_size = [100, 100])
      @grid_size = grid_size
      @trainers = []
      @kudomons = []
  end

  def add_kudomon( kudomon)
    if(kudomon.kind_of? Kudomon)
      @kudomons.push(kudomon)
    else
      raise "Object must be Kudomon"
    end
  end

  def add_trainer(trainer)
    if(trainer.kind_of? Trainer)
      @trainers.push(trainer)
    else
      raise "Object must be Trainer"
    end
  end

end
