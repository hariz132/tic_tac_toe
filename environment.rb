require './player'
require './board'

Player.new('X', 'Player 1')
Player.new('O', 'Player 2')
current_board = Board.new

loop do
  Player.all.each do |player|
    puts current_board.display_board
    puts "Please input for #{player.name} (#{player.symbol}):"
    loop do
      input = gets.chomp.split(' ').map(&:to_i)
      if current_board.grid(input).empty?
        current_board.update_board(input, player)
        player.grids << current_board.grid(input)
        break
      else
        puts 'Grid already filled, please try again:'
      end
    end
  end
end
