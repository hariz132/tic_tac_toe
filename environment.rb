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
        unless (input - [0, 1, 2]).empty?
          puts 'Invalid coordinates given, please try again:'
          next
        end
        if current_board.grid(input).empty?
          current_board.update_board(input, player)
        else
          puts 'Grid already filled, please try again:'
          next
        end
        break unless current_board.player_win?(input, player)

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
