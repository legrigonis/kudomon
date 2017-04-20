require_relative './Kudomon.rb'
require_relative './kudomons/Sourbulb.rb'

class Trainer

    attr_accessor :name, :position, :game

  def initialize(game,  name, position = [0, 0])
    #TODO prevent kudmon beeing placed outside the grid
    @game = game
    @name = name
    @position = position
    @kudomons = []
  end

  def nearest_kudomon
    kudomon =  @game.nearest_kudomon(@position)
  end

  def catch_kudomon
    kudomon = self.nearest_kudomon
    #check if not null
    if kudomon.nil?
      raise "No Kudomons to be catched"
    else
      @game.kudomons.delete(kudomon)
      kudomon.owner_name = @name
      @kudomons.push(kudomon)
    end
  end

end
