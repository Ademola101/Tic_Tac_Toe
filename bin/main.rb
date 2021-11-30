require_relative '../lib/draw.rb'
puts "Starting Tic Tac game"
puts "Enter player 1 name"
player_1 = gets.chomp().capitalize
puts ""
puts "Enter player 2 name"
player_2 = gets.chomp().capitalize
puts ""

system 'cls'
system 'clear'

players = ['O', "X"]
current_player = players[rand(2)]
b = Board.new(current_player)
puts
puts " Welcome to the board \n #{player_1} will play as #{players[0]} and #{player_2} will play as #{players[1]}"
puts "Let's start"

system 'cls'
system 'clear'


b.display()
for i in 1..9
  puts "it's #{player_1}'s turn"
  puts "Please select an available cell from the board"
  while true
    input = gets.chomp().to_i
    case input.to_i
    when input.nil? || !(input.to_i >= 1 && input.to_i < 10)
      next
    when 1..9
      input
      puts " #{player_1} value valid"
      break
    else puts "invalid value, please select from the available cell only"
    end
  end
  
  system 'cls'
  system 'clear'
  
  puts "it's #{player_2}'s turn"
  puts "Please select an available cell from the board"
  while true
    input = gets.chomp().to_i
    case input.to_i
    when input.nil? || !(input.to_i >= 1 && input.to_i < 10)
      next
    when 1..9
      input
      puts " #{player_2} value valid"
      break
    else puts "invalid value, please select from the available cell only"
    end
  end
end
  