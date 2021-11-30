require_relative '../lib/draw.rb'
puts "Starting Tic Tac game"
players = ['O', "X"]
current_player = players[rand(2)]
b = Board.new(current_player)
b.display()
puts

