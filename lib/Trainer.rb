require_relative './Kudomon.rb'
require_relative './kudomons/Sourbulb.rb'

class Trainer

    attr_accessor :name, :position, :game

  def initialize(game,  name, position = [0, 0])
    @game = game
    @name = name
    @position = position
    @kudomons = []
  end

  def nearest_kudomon
    kudomon =  @game.nearest_kudomon(@position)

    
  end

end
