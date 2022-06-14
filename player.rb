class Player
  attr_reader :marker, :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(marker, name)
    @marker = marker
    @name = name
    @@all << self
  end
end
