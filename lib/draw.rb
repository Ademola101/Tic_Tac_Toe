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
    for row in 0..BOARD_MAX_INDEX
      for col in 0..BOARD_MAX_INDEX
        if @board[row][col] == EMPTY_POSITION
          return false
        end
      end
    end
    return true
  end
end