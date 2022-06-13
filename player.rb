class Player
  attr_reader :symbol, :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(symbol, name)
    @symbol = symbol
    @name = name
    @@all << self
  end
end
