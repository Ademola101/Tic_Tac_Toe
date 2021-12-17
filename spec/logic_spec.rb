require_relative '../lib/logic'

describe Board do
  describe '#board_full' do
    context 'check if the board is full or not' do
      let(:board_test) { Board.new('X') }
      it 'should return false if the board is empty' do
        expect(board_test.board_full).to eql false if @board == ''
      end

      let(:board_test) { Board.new('X') }
      it 'should return true if the board is not empty' do
        expect(board_test.board_full).to eql true if @board == 4
      end
    end
  end
end
