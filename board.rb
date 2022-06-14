require './grid'

class Board
  attr_reader :grids

  def initialize
    @grids = { 1 => Grid.new(1), 2 => Grid.new(2), 3 => Grid.new(3), 4 => Grid.new(4), 5 => Grid.new(5),
               6 => Grid.new(6), 7 => Grid.new(7), 8 => Grid.new(8), 9 => Grid.new(9) }
  end

  def display_board_coordinates
    puts " #{grids[1].coordinate} | #{grids[2].coordinate} | #{grids[3].coordinate} "
    puts '-----------'
    puts " #{grids[4].coordinate} | #{grids[5].coordinate} | #{grids[6].coordinate} "
    puts '-----------'
    puts " #{grids[7].coordinate} | #{grids[8].coordinate} | #{grids[9].coordinate} "
  end

  def display_board
    puts " #{grids[1].value} | #{grids[2].value} | #{grids[3].value} "
    puts '-----------'
    puts " #{grids[4].value} | #{grids[5].value} | #{grids[6].value} "
    puts '-----------'
    puts " #{grids[7].value} | #{grids[8].value} | #{grids[9].value} "
  end

  def update_board(input, player)
    grids[input].value = player.marker
    grids[input].player = player
  end

  def player_win?(input, player)
    case input
    when 1
      row1_win?(player) || column1_win?(player) || diagonal1_win?(player)
    when 2
      row1_win?(player) || column2_win?(player)
    when 3
      row1_win?(player) || column3_win?(player) || diagonal2_win?(player)
    when 4
      row2_win?(player) || column1_win?(player)
    when 5
      row2_win?(player) || column2_win?(player) || diagonal1_win?(player) || diagonal2_win?(player)
    when 6
      row2_win?(player) || column3_win?(player)
    when 7
      row3_win?(player) || column1_win?(player) || diagonal2_win?(player)
    when 8
      row3_win?(player) || column2_win?(player)
    when 9
      row3_win?(player) || column3_win?(player) || diagonal1_win?(player)
    end
  end

  private

  def row1_win?(player)
    grids[1].player.equal?(player) && grids[2].player.equal?(player) && grids[3].player.equal?(player)
  end

  def row2_win?(player)
    grids[4].player.equal?(player) && grids[5].player.equal?(player) && grids[6].player.equal?(player)
  end

  def row3_win?(player)
    grids[7].player.equal?(player) && grids[8].player.equal?(player) && grids[9].player.equal?(player)
  end

  def column1_win?(player)
    grids[1].player.equal?(player) && grids[4].player.equal?(player) && grids[7].player.equal?(player)
  end

  def column2_win?(player)
    grids[2].player.equal?(player) && grids[5].player.equal?(player) && grids[8].player.equal?(player)
  end

  def column3_win?(player)
    grids[3].player.equal?(player) && grids[6].player.equal?(player) && grids[9].player.equal?(player)
  end

  def diagonal1_win?(player)
    grids[1].player.equal?(player) && grids[5].player.equal?(player) && grids[9].player.equal?(player)
  end

  def diagonal2_win?(player)
    grids[7].player.equal?(player) && grids[5].player.equal?(player) && grids[3].player.equal?(player)
  end
end
