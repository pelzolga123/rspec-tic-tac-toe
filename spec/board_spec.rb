# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  winner = {
    1 => 'X', 2 => 'X', 3 => 'X',
    4 => ' ', 5 => ' ', 6 => ' ',
    7 => ' ', 8 => ' ', 9 => ' '
  }

  draw = {
    1 => 'X', 2 => 'O', 3 => 'O',
    4 => 'O', 5 => 'X', 6 => 'X',
    7 => 'X', 8 => 'X', 9 => 'O'
  }

  let(:board) { Board.new }
  let(:drawn_board) { Board.new(draw) }
  let(:winning_board) { Board.new(winner) }

  context 'when the board is in a winning state' do
    describe '#winner?' do
      it 'should return true' do
        expect(winning_board.winner?).to be true
      end
    end

    describe '#draw?' do
      it 'should return false' do
        expect(winning_board.draw?).to be false
      end
    end
  end

  context 'when the board is in a drawn state' do
    describe '#winner?' do
      it 'should return false' do
        expect(drawn_board.winner?).to be false
      end
    end

    describe '#draw?' do
      it 'should return true' do
        expect(drawn_board.draw?).to be true
      end
    end
  end

  context 'when a player tries to place a marker in an valid location' do
    describe '#valid_selection?' do
      it 'should return true' do
        expect(board.valid_selection?(5)).to be true
      end
    end

    describe '#place_marker' do
      it 'should return the players marker' do
        expect(board.place_marker(5, 'X')).to eq('X')
      end
    end
  end

  context 'when a player tries to place a marker in an invalid location' do
    describe '#valid_selection?' do
      it 'should return false if the selection is out of range' do
        expect(board.valid_selection?(10)).to be false
      end

      it 'should return false if the selection is already taken' do
        board.place_marker(5, 'X')
        expect(board.valid_selection?(5)).to be false
      end
    end
  end
end
