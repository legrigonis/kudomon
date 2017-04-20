require_relative './kudomon'
require_relative './trainer'

class Game

  attr_accessor :kudomons, :trainers
  #kudomons is not exaclty gramatically correct but I believe it adds some clarity
  def initialize(grid_size = [100, 100])
      @grid_size = grid_size
      @trainers = []
      @kudomons = []
  end

  def add_kudomon(kudomon)
    if((kudomon.kind_of? Kudomon) && kudomon.position[0] <= @grid_size[0] && kudomon.position[1] <= @grid_size[1] &&
      kudomon.position[0] >= 0 && kudomon.position[1] >= 0)
      @kudomons.push(kudomon)
    else
      raise "Object must be Kudomon"
    end
  end

  def remove_kudomon(kudomon)
    @kudomons.delete(kudomon)
  end

  def add_trainer(trainer)
    if(trainer.kind_of? Trainer)
      @trainers.push(trainer)
    else
      raise "Object must be Trainer"
    end
  end

  def self.eucl_sq_distance(pos1, pos2)
    ((pos1[0]- pos2[0]) ** 2) + ((pos1[1]- pos2[1]) ** 2)
  end

  def nearest_kudomon(trainer)
    if (@kudomons.empty?)
      return nil
    end
    pos = trainer.position
    min_dist = +1.0/0.0
    min_kudomon = nil
    for kudomon in @kudomons
      new_dist = Game.eucl_sq_distance(pos, kudomon.position)
      if (new_dist < min_dist && !(trainer.kudomons.include? kudomon))
        min_dist = new_dist
        min_kudomon = kudomon
      end
    end
    min_kudomon
  end
end
