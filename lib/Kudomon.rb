class Kudomon

  attr_accessor :type, :position, :hp, :cp, :owner_id


  def initialize(type, position = [0, 0], hp = 100, cp = 10)
    @type = type
    @position_x = position
    @hp = hp
    @cp = cp
    @owner_id = owner_id
  end

  def attack(enemy_kudomon)
    enemy_kudomon.hp -= cp;
  end

end
