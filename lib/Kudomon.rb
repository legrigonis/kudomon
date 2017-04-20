class Kudomon

  attr_accessor :name, :type, :position, :hp, :cp, :owner_name

  def initialize(name, type, position = [0, 0], hp = 100, cp = 10)
    @name = name
    @type = type
    @position = position
    @hp = hp
    @cp = cp
    @owner_name = nil
  end

  def copy
    Kudomon.new(self.name, self.type, self.position, self.hp, self.cp)
  end
end
