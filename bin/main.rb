require_relative '../lib/draw'

require_relative '../lib/logic'

puts 'Starting Tic Tac Toc Game.....'

def player_input(player)
  begin
    puts "Enter #{player} name :"
    input = gets.chomp.capitalize
    raise StandardError, "#{player} have not entered any name" if input.empty? || input == ''
    raise StandardError, "#{player} the name is invalid. Name should be at least three (3) letters." if input.length < 3
  rescue StandardError => e
    puts e.message
    retry
  else
    player = input
  end
  player
end

player1 = player_input('Player 1')
player2 = player_input('Player 2')

puts ''
sleep 1

system 'cls'

system 'clear'

players = %w[O X]

current_player = players[rand(2)]

b = Board.new(current_player)

puts

puts "Welcome to the board \n #{player1} will play as #{players[0]} and #{player2} will play as #{players[1]}"

puts "Let's start"

sleep 2

system 'cls'

system 'clear'

b.display

while !b.board_full and !b.winner

  b.ask_player_for_move(current_player)

  current_player = b.collect_next_turn

  b.display

  puts

end

if b.winner

  puts "Player #{b.collect_next_turn} wins"

else

  puts 'The game is Tie'

  puts 'Game over'

end
