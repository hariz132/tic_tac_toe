require './player'
require './board'

def play_game
  current_board = Board.new
  puts "\nCoordinates:"
  current_board.display_board_coordinates
  loop do
    Player.all.each do |player|
      puts "\n"
      puts current_board.display_board
      puts "Please input for #{player.name} (#{player.marker}):"
      loop do
        input = gets.chomp.to_i
        unless (1..9).include?(input)
          puts 'Invalid coordinate given, please try again:'
          next
        end
        if current_board.grids[input].empty?
          current_board.update_board(input, player)
        else
          puts 'Coordinate already filled, please try again:'
          next
        end
        break unless current_board.player_win?(input, player)

        puts current_board.display_board
        puts "#{player.name} (#{player.marker}) wins!"
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
