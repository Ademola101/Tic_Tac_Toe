require_relative '../lib/logic'
class Draw < Board
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
end
