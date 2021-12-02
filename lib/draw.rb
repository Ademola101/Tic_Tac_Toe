class Board
  BOARD_MAX_INDEX = 2
  EMPTY_POSITION = ''.freeze
  attr_accessor :current_player

  def initialize(current_player)
    @current_player = current_player
    @board = Array.new(BOARD_MAX_INDEX + 1) { Array.new(BOARD_MAX_INDEX + 1) { EMPTY_POSITION } }
  end

  def display
    puts '+- - - - - -+'
    (0..BOARD_MAX_INDEX).each do |row|
      print '| '
      (0..BOARD_MAX_INDEX).each do |col|
        s = @board[row][col]
        if s == EMPTY_POSITION
          print col + (row * 3) + 1
        else
          print s
        end
        print ' | '
      end
      puts "\n+- - - - - -+"
    end
  end

  def full_board
    (0..BOARD_MAX_INDEX).each do |row|
      (0..BOARD_MAX_INDEX).each do |col|
        if @board[row][col] == EMPTY_POSITION
          return false
        end
      end
    end
    true
  end

def winner
  winner = winner_rows()
  if winner
    return winner
  end
  winner = winner_cols()
  if winner
    return winner
  end
   winner = winner_diagonals()
  if winner
    return winner
  end
   # No winners
   return
  end
end