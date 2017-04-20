require_relative './kudomon'
require_relative './trainer'
class Battle

  KUDOMON_STRENGTHS = [:water, :fire, :grass, :rock, :electric, :water]
  SUPER_EFFECTIVE = 2

  def fight(trainer1, trainer2)
    kudomon1 = trainer1.kudomons.sample
    kudomon2 = trainer2.kudomons.sample
    hp1 = kudomon1.hp
    hp2 = kudomon2.hp
    cp1 = kudomon1.cp
    cp2 = kudomon2.cp

    #determine if anyone is SUPER_EFFECTIVE
    if (kudomon1.type != :psychic) && (kudomon2.type != :psychic)
      for i in 1..(KUDOMON_STRENGTHS.length)-1 do
        if kudomon1.type == KUDOMON_STRENGTHS[i] && kudomon2.type == KUDOMON_STRENGTHS[i-1]
          cp2 *= SUPER_EFFECTIVE
        elsif kudomon2.type == KUDOMON_STRENGTHS[i] && kudomon1.type == KUDOMON_STRENGTHS[i-1]
          cp1 *= SUPER_EFFECTIVE
        end
      end
    elsif kudomon1.type != :psychic && kudomon2.type == :psychic
      cp2 *= SUPER_EFFECTIVE
    elsif kudomon1.type == :psychic && kudomon2.type != :psychic
      cp1 *= SUPER_EFFECTIVE
    end

    #randomize who starts the fight
    if rand(0..1) == 0
      hp2 -= cp1
    end

    while (hp1 > 0 and hp2 > 0)
      hp1 -= cp2
      if hp1 <= 0
        return trainer2
      end
      hp2 -= cp1
    end
    trainer1
  end

end
