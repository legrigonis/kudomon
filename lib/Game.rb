require './Kudomon.rb'
require './kudomons/Sourbulb.rb'
require './Trainer.rb'

class Game

  attr_accessor :kudomons, :players

  def initialize(grid_size = Tuple[100, 100])
      @grid_size = grid_size
      @players = []
      @kudomons = Hash.new
  end

  def add_kudomon( kudomon)
    if (kudomons.haskey?(kudomon.position))
      puts "2 kudomons cannot be placed at the same place"
    else
      kudomons[kudomon.position] = kudomon
    end
  end

end
