class Kudomon

  attr_accessor :type, :position, :hp, :cp, :owner_name


  def initialize(type, position = [0, 0], hp = 100, cp = 10)
    @type = type
    @position = position
    @hp = hp
    @cp = cp
    @owner_name = nil
  end

  def attack(enemy_kudomon)
    enemy_kudomon.hp -= cp;
  end

end
