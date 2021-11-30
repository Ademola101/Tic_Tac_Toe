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

system 'cls'
system 'clear'

players = %w[O X]
current_player = players[rand(2)]
b = Board.new(current_player)
puts
puts "Welcome to the board \n #{player1} will play as #{players[0]} and #{player2} will play as #{players[1]}"
puts "Let's start"

system 'cls'
system 'clear'
the_loop = 0..4
the_loop.each do
  b.display()
  puts "it's #{player1}'s turn"
  puts 'Please select an available cell from the board'
  while true
    input = gets.chomp()
    case input.to_i
    when input.nil? || !(input.to_i >= 1 && input.to_i < 10)
      next
    when 1..9
      input.to_i
      puts " #{player1} value valid"
      break
    else puts 'invalid value, please select from the available cell only'
    end
  end

  system 'cls'
  system 'clear'

  b.display
  puts "it's #{player2}'s turn"
  puts 'Please select an available cell from the board'
  while true
    input = gets.chomp
    case input.to_i
    when input.nil? || !(input.to_i >= 1 && input.to_i < 10)
      next
    when 1..9
      input.to_i
      puts "#{player2} value valid"
      break
    else puts 'invalid value, please select from the available cell only'
    end
  end
  system 'cls'
  system 'clear'
end

puts "It's a tie for now"
puts 'till we work on logic'
puts 'thank you'
