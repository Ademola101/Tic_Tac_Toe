#!/usr/bin/env ruby
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

require_relative '../lib/draw'
class Board
  BOARD_MAX_INDEX = 2
  EMPTY_POSITION = ''.freeze
  attr_accessor :current_player

  def initialize(current_player)
    @current_player = current_player
    @board = Array.new(BOARD_MAX_INDEX + 1) { Array.new(BOARD_MAX_INDEX + 1) { EMPTY_POSITION } }
  end

  def board_full
    (0..BOARD_MAX_INDEX).each do |row|
      (0..BOARD_MAX_INDEX).each do |col|
        return false if @board[row][col] == EMPTY_POSITION
      end
    end
    true
  end

  def winner_rows
    (0..BOARD_MAX_INDEX).each do |row_index|
      first_symbol = @board[row_index][0]
      (0..BOARD_MAX_INDEX).each do |col_index|
        break if first_symbol != @board[row_index][col_index]
        return first_symbol if col_index == BOARD_MAX_INDEX && first_symbol != EMPTY_POSITION
      end
    end
    nil
  end

  def winner_cols
    (0..BOARD_MAX_INDEX).each do |col_index|
      first_symbol = @board[0][col_index]
      (1..BOARD_MAX_INDEX).each do |row_index|
        break if first_symbol != @board[row_index][col_index]
        return first_symbol if row_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POSITION
      end
    end
    nil
  end

  def winner_diagonals
    first_symbol = @board[0][0]
    (1..BOARD_MAX_INDEX).each do |index|
      break if first_symbol != @board[index][index]
      return first_symbol if index == BOARD_MAX_INDEX and first_symbol != EMPTY_POSITION
    end
    first_symbol = @board[0][BOARD_MAX_INDEX]
    row_index = 0
    col_index = BOARD_MAX_INDEX
    while row_index < BOARD_MAX_INDEX
      row_index += 1
      col_index -= 1
      break if first_symbol != @board[row_index][col_index]
      return first_symbol if row_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POSITION
    end
    nil
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

  def validate_position(row, col)
    if row <= @board.size and col <= @board.size
      return true if @board[row][col] == EMPTY_POSITION

      puts 'That position is occupied.'
    else
      puts 'Invalid position.'
    end
    false
  end

  def ask_player_for_move(current_player)
    played = false
    until played
      puts " Player #{current_player}, where would you like to play ?"
      move = gets.to_i - 1
      col = move % @board.size
      row = (move - col) / @board.size
      if validate_position(row, col)
        @board[row][col] = current_player
        played = true
      end
      sleep 1
    end

    def collect_next_turn
      @current_player = if @current_player == 'X'
                          'O'
                        else
                          'X'
                        end
      @current_player
    end
  end
end

# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
