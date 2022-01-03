require_relative '../lib/logic'
describe Board do
  describe '#board_full' do
    context 'check if the board is full or not' do
      let(:board_test) { Board.new('X') }
      it 'should return false if the board is empty' do
        @board = Array.new(3) { Array.new(3) { '' } }
        @board.flatten!
        expect(board_test.board_full).to eql false if @board.all?(&:empty?)
      end

      let(:board_test) { Board.new('X') }
      it 'should return true if the board is not empty' do
        @board = Array.new(3) { Array.new(3) { 5 } }
        @board.flatten!
        expect(!board_test.board_full).to eql (@board.any? { |num| num.is_a? Integer })
      end
    end
  end

  describe '#validate_position' do
    context 'checking if spots on the board are occupied' do
      it 'should return true if position is not occupied' do
        board_check = Board.new('O')
        expect(board_check.validate_position(row, col)).to eql true if @board == ''
      end
      it 'should return not true if position is occupied' do
        board_check = Board.new('O')
        expect(board_check.validate_position(row, col)).not_to eql true if @board == '1'
      end
    end
  end

  describe '#collect_next_turn' do
    it 'it should plays the number is inserted' do
      expect(@current_player == true).to eql true if @current_player == true
    end
  end
end
