require_relative '../lib/logic'

describe Board do
  describe 'board-full' do
    context 'check if the board is full or not' do
      it 'should return false if the board is'do
        board_test = Board.new('X')
        if @board == ''
          expect(board_test.board_full).to eql false
        end
      end
      it "should return true if the board is not true" do
        board_test = Board.new('X')
        if @board == 4
          expect(board_test.board_full).to eql true
        end
      end
    end
  end
end
