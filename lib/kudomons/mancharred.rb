class Mancharred < Kudomon
  #could potentially have some special moves, overwrite some features.
  def initialize(position = [0, 0], hp = 100, cp = 10)
    @name = :Sourbulb
    @type = :fire
    super(name, type, position, hp, cp)
  end
end
