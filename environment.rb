require './player'
require './board'

def play_game
  current_board = Board.new
  loop do
    Player.all.each do |player|
      puts current_board.display_board
      puts "Please input for #{player.name} (#{player.symbol}):"
      loop do
        input = gets.chomp.split(' ').map(&:to_i)
        if current_board.grid(input).empty?
          current_board.update_board(input, player)
          break
        else
          puts 'Grid already filled, please try again:'
        end
      end
      if current_board.player_win?(player)
        puts current_board.display_board
        puts "#{player.name} wins!"
        return
      end
    end
  end
end

Player.new('X', 'Player 1')
Player.new('O', 'Player 2')

loop do
  play_game
  puts '-----------------'
  puts 'Play again? (y/n)'
  break if gets.chomp.downcase == 'n'
end
