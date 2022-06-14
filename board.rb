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
    puts " #{grid([0, 0]).value} | #{grid([1, 0]).value} | #{grid([2, 0]).value} "
    puts '-----------'
    puts " #{grid([0, 1]).value} | #{grid([1, 1]).value} | #{grid([2, 1]).value} "
    puts '-----------'
    puts " #{grid([0, 2]).value} | #{grid([1, 2]).value} | #{grid([2, 2]).value} "
  end

  def grid(input)
    grids.dig(*input)
  end

  def update_board(input, player)
    grid(input).value = player.symbol
    grid(input).player = player
  end

  def player_win?(input, player)
    case input
    when [0, 0]
      row1_win?(player) || column1_win?(player) || diagonal1_win?(player)
    when [1, 0]
      row1_win?(player) || column2_win?(player)
    when [2, 0]
      row1_win?(player) || column3_win?(player) || diagonal2_win?(player)
    when [0, 1]
      row2_win?(player) || column1_win?(player)
    when [1, 1]
      row2_win?(player) || column2_win?(player) || diagonal1_win?(player) || diagonal2_win?(player)
    when [2, 1]
      row2_win?(player) || column3_win?(player)
    when [0, 2]
      row3_win?(player) || column1_win?(player) || diagonal2_win?(player)
    when [1, 2]
      row3_win?(player) || column2_win?(player)
    when [2, 2]
      row3_win?(player) || column3_win?(player) || diagonal1_win?(player)
    end
  end

  private

  def row1_win?(player)
    grid([0, 0]).player.equal?(player) && grid([1, 0]).player.equal?(player) && grid([2, 0]).player.equal?(player)
  end

  def row2_win?(player)
    grid([0, 1]).player.equal?(player) && grid([1, 1]).player.equal?(player) && grid([2, 1]).player.equal?(player)
  end

  def row3_win?(player)
    grid([0, 2]).player.equal?(player) && grid([1, 2]).player.equal?(player) && grid([2, 2]).player.equal?(player)
  end

  def column1_win?(player)
    grid([0, 0]).player.equal?(player) && grid([0, 1]).player.equal?(player) && grid([0, 2]).player.equal?(player)
  end

  def column2_win?(player)
    grid([1, 0]).player.equal?(player) && grid([1, 1]).player.equal?(player) && grid([1, 2]).player.equal?(player)
  end

  def column3_win?(player)
    grid([2, 0]).player.equal?(player) && grid([2, 1]).player.equal?(player) && grid([2, 2]).player.equal?(player)
  end

  def diagonal1_win?(player)
    grid([0, 0]).player.equal?(player) && grid([1, 1]).player.equal?(player) && grid([2, 2]).player.equal?(player)
  end

  def diagonal2_win?(player)
    grid([0, 2]).player.equal?(player) && grid([1, 1]).player.equal?(player) && grid([2, 0]).player.equal?(player)
  end
end
