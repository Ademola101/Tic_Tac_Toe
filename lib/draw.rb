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
    winner = winner_rows

    winner = winner_cols
    return winner if winner

    winner = winner_diagonals
    return winner if winner

    # No winners
    nil
  end

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
  def winner_rows
    for row_index in 0..BOARD_MAX_INDEX
      first_symbol = @board[row_index][0]
      for col_index in 0..BOARD_MAX_INDEX
        if first_symbol != @board[row_index][col_index]
          break
        elsif col_index == BOARD_MAX_INDEX && first_symbol != EMPTY_POSITION
          return first_symbol
        end
      end
    end
    return
  end
  
  def winner_cols
    for col_index in 0..BOARD_MAX_INDEX
      first_symbol = @board[0][col_index]
      for row_index in 1..BOARD_MAX_INDEX
        if first_symbol != @board[row_index][col_index]
          break
        elsif row_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
          return first_symbol
        end
      end
    end
    return
  end
  
  def winner_diagonals
    first_symbol = @board[0][0]
    for index in 1..BOARD_MAX_INDEX
      if first_symbol != @board[index][index]
        break
      elsif index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
        return first_symbol
      end
    end
    first_symbol = @board[0][BOARD_MAX_INDEX]
    row_index = 0
    col_index = BOARD_MAX_INDEX
    while row_index < BOARD_MAX_INDEX
      row_index = row_index + 1
      col_index = col_index - 1
      if first_symbol != @board[row_index][col_index]
        break
      elsif row_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
        return first_symbol
      end
    end
    return
  end
  
  def validate_position(row, col)
    if row <= @board.size and col <= @board.size
      if @board[row][col] == EMPTY_POS
        return true
      else
        puts "That position is occupied."
      end
    else
      puts "Invalid position."
    end
    return false
  end

  def get_next_turn
    if @current_player == 'X'
      @current_player = 'O'
    else
      @current_player = 'X'
    end
    return @current_player
  end

  def ask_player_for_move(current_player)
    if current_player == COMPUTER_PLAYER
      computer_move(current_player)
    else
      human_move(current_player)
    end
  end

end
