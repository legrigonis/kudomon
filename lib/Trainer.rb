require_relative './Kudomon.rb'
require_relative './kudomons/Sourbulb.rb'

class Trainer

    attr_accessor :name, :position, :game, :kudomons

  def initialize(game,  name, position = [0, 0])
    #TODO prevent kudmon beeing placed outside the grid
    @game = game
    @name = name
    @position = position
    @kudomons = []
  end

  def nearest_kudomon
    kudomon =  @game.nearest_kudomon(self)
  end

#We assume that the same pokemon can be cought multiple times therefore we copy the Object
#rather than by refference it. It results in functionality where multile people can catch it
  def catch_kudomon
    if self.nearest_kudomon.nil?
      raise "No Kudomons to be catched"
    else
      kudomon = self.nearest_kudomon.copy
      kudomon.owner_name = @name
      @kudomons.push(kudomon)
    end
  end

end
