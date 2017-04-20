require_relative './Kudomon.rb'
require_relative './kudomons/Chikapu.rb'
require_relative './kudomons/Lesquirt.rb'
require_relative './kudomons/Mancharred.rb'
require_relative './kudomons/Passnose.rb'
require_relative './kudomons/Sourbulb.rb'
require_relative './kudomons/Twomew.rb'

class Trainer

    attr_accessor :name, :position, :game, :kudomons

  def initialize(game,  name, position = [0, 0])
    @game = game
    @name = name
    @position = position
    @kudomons = []
  end

  def nearest_kudomon
    kudomon =  @game.nearest_kudomon(self)
  end

#We assume that the same pokemon can be caught multiple times, therefore we copy the Object
#rather than by reference it. It results in functionality where multile people can catch it.
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
