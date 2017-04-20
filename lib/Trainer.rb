require_relative './Kudomon.rb'
require_relative './kudomons/Sourbulb.rb'

class Trainer

    attr_accessor :name, :position

  def initialize(name, position = [0, 0])
    @name = name
    @position = position
    @kudomons = []
  end

end
