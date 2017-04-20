require_relative './kudomon'
require_relative './kudomons/sourbulb'
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

    if (kudomon1.type != :psychic) && (kudomon2.type != :psychic)
      for i in [1..KUDOMON_STRENGTHS.length-1]
        if kudomon1.type == KUDOMON_STRENGTHS[i] && kudomon2.type == KUDOMON_STRENGTHS[i-1]
          cp2 *= SUPER_EFFECTIVE
          break
        elsif kudomon2.type == KUDOMON_STRENGTHS[i] && kudomon1.type == KUDOMON_STRENGTHS[i-1]
          cp1 *= SUPER_EFFECTIVE
          break
        end
      end
    elsif kudomon1.type != :psychic && kudomon2.type == :psychic
      cp2 *= SUPER_EFFECTIVE
    else
      cp1 *= SUPER_EFFECTIVE
    end

    if rand(0..1) == 0
      hp2 -= cp1
    end
    while (hp1 > 0 and hp2 > 0)
      hp1 -= cp2
      if hp1 <= 0
        break
      end
      hp2 -= cp1
    end
    if hp1 <= 0
      trainer2
    else
      trainer1
    end
  end

end
