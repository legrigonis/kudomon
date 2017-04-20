require './Kudomon.rb'
require './kudomons/Sourbulb.rb'

class Trainer

  def initialize(name, position = [0, 0])
    @name = name
    @position = position
    @kudomons = []
  end

end
