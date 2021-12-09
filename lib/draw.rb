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
        return false if @board[row][col] == EMPTY_POSITION
      end
    end
    true
  end

  def winner
    winner = winner_rows
    return winner if winner

    winner = winner_cols
    return winner if winner

    winner = winner_diagonals
    return winner if winner

    # No winners
    nil
  end

  def ask_player_for_move(current_player)
    played = false
    until played
      put " Player #{current_player}, where would you like to play ?"
      move = gets.to_i - 1
      col = move % @board.size
      row = (move - col ) / @board.size
      if validation_postion(row , col)
        @board[row][col] = current_player
        played = true
    end
  end
end
