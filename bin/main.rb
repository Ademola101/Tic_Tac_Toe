require_relative '../lib/draw'

puts 'Starting Tic Tac game'

puts 'Enter player 1 name'

player1 = gets.chomp

player1 = player1.capitalize

puts ''

puts 'Enter player 2 name'

player2 = gets.chomp

player2 = player2.capitalize

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



while not b.board_full and not b.winner

  b.ask_player_for_move(current_player)

  current_player = b.get_next_turn

  b.display

  puts

end



if b.winner()

  puts "Player #{b.get_next_turn} wins"

else

  puts "The game is Tie"

puts "Game over"
<<<<<<< HEAD
end
=======





>>>>>>> b94652f105fb0f6e34614cf4b3c390bc2ca4d5c0
# the_loop = 0..4

# the_loop.each do

#   b.display

#   puts "it's #{player1}'s turn"

#   puts 'Please select an available cell from the board'

#   loop do

#     input = gets.chomp

#     case input.to_i

#     when input.nil? || !(input.to_i >= 1 && input.to_i < 10)

#       next

#     when 1..9

#       input.to_i

#       puts " #{player1} value valid"

#       break

#     else puts 'invalid value, please select from the available cell only'

#     end

#   end



#   system 'cls'

#   system 'clear'



#   b.display

#   puts "it's #{player2}'s turn"

#   puts 'Please select an available cell from the board'

#   loop do

#     input = gets.chomp

#     case input.to_i

#     when input.nil? || !(input.to_i >= 1 && input.to_i < 10)

#       next

#     when 1..9

#       input.to_i

#       puts "#{player2} value valid"

#       break

#     else puts 'invalid value, please select from the available cell only'

#     end

#   end

#   system 'cls'

#   system 'clear'

# end



# puts "It's a tie for now"

# puts 'till we work on logic'

# puts 'thank you'

end
