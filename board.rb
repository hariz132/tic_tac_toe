require './grid'

class Board
  attr_accessor :grids

  def initialize
    @grids = [
      [Grid.new([0, 0]), Grid.new([0, 1]), Grid.new([0, 2])],
      [Grid.new([1, 0]), Grid.new([1, 1]), Grid.new([1, 2])],
      [Grid.new([2, 0]), Grid.new([2, 1]), Grid.new([2, 2])]
    ]
  end

  def display_board
    puts " #{grid([0, 0]).value} | #{grid([0, 1]).value} | #{grid([0, 2]).value} "
    puts '-----------'
    puts " #{grid([1, 0]).value} | #{grid([1, 1]).value} | #{grid([1, 2]).value} "
    puts '-----------'
    puts " #{grid([2, 0]).value} | #{grid([2, 1]).value} | #{grid([2, 2]).value} "
  end

  def grid(input)
    grids.dig(*input)
  end

  def update_board(input, player)
    grid(input).value = player.symbol
    grid(input).player = player
  end
end