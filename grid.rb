class Grid
  attr_accessor :value, :player
  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @value = ' '
  end

  def empty?
    player.nil?
  end
end
