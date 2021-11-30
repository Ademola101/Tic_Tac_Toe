require_relative '../lib/draw.rb'
puts "Starting Tic Tac game"
puts "Enter player 1 name"
player_1 = gets.chomp()
puts ""
puts "Enter player 2 name"
player_2 = gets.chomp()
puts ""

system 'cls'
system 'clear'

players = ['O', "X"]
current_player = players[rand(2)]
b = Board.new(current_player)
b.display()
puts
puts " Welcome to the board \n #{player_1} will play as #{players[0]} and #{player_2} will play as #{players[1]}"
puts "Let's start"

system 'cls'
system 'clear'

