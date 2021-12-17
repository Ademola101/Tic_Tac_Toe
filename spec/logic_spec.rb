require_relative '../lib/logic'

describe Board do
  describe '#board_full' do
    context 'check if the board is full or not' do
      let(:board_test) { Board.new('X') }
      it 'should return false if the board is empty' do
        expect(board_test.board_full).to eql false if @board == ''
      end

      let(:board_test){ Board.new('X') }
      it 'should return true if the board is not empty' do
        expect(board_test.board_full).to eql true if @board == 4
      end
    end
  end

  describe "#validate_position" do
    context 'checking if spots on the board are occupied' do
      it 'should return true if position is not occupied' do
        board_check = Board.new('O')
        if @board == ''
          expect(board_check.validate_position(row, col)).to eql true
        end
      end
      it 'should return not true if position is occupied' do
        board_check = Board.new('O')
        if @board == '1'
          expect(board_check.validate_position(row, col)).not_to eql true
        end
      end
    end
  end
end
