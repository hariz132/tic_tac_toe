class Grid
  attr_accessor :value, :player

  def initialize(coordinate)
    @coordinate = coordinate
    @value = ' '
  end

  def empty?
    player.nil?
  end
end
