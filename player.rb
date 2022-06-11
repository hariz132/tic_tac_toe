class Player
  attr_accessor :symbol, :name, :grids

  @@all = []

  def self.all
    @@all
  end

  def initialize(symbol, name)
    @symbol = symbol
    @name = name
    @grids = []
    @@all << self
  end
end
