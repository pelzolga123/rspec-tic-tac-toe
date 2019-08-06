# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'

describe Game do
  empty_board = Board.new(
    1 => ' ', 2 => ' ', 3 => ' ',
    4 => ' ', 5 => ' ', 6 => ' ',
    7 => ' ', 8 => ' ', 9 => ' '
  )

  win = Board.new(
    1 => 'X', 2 => 'X', 3 => 'X',
    4 => ' ', 5 => ' ', 6 => ' ',
    7 => ' ', 8 => ' ', 9 => ' '
  )

  draw = Board.new(
    1 => 'X', 2 => 'O', 3 => 'O',
    4 => 'O', 5 => 'X', 6 => 'X',
    7 => 'X', 8 => 'X', 9 => 'O'
  )

  let(:game) { Game.new }
  let(:game_win) { Game.new(win) }
  let(:game_draw) { Game.new(draw) }

  context 'when a new game is created' do
    describe '#initialize' do
      it 'should create a new empty board' do
        expect(game.board).to be_a Board
        expect(game.board.board).to eq(empty_board.board)
      end
    end

    describe '#state' do
      it 'should return :active' do
        expect(game.state).to eq(:active)
      end
    end
  end

  context 'when the game is active and the player takes a turn' do
    describe '#switch_player' do
      it 'should switch the current player' do
        initial_player = game.current_player
        game.switch_player
        expect(game.current_player).not_to eq(initial_player)
      end
    end

    describe '#turn' do
      it 'should place a marker at the selected position' do
        game.turn(5)
        expect(game.board.board[5]).to(satisfy) { |x| %w[X O].include?(x) }
      end
    end

    describe '#state' do
      it 'should return :active' do
        expect(game.state).to eq(:active)
      end
    end
  end

  context 'when the game is in a winning state' do
    describe '#state' do
      it 'should return :winner' do
        expect(game_win.state).to eq(:winner)
      end
    end
  end

  context 'when the game is in a drawn state' do
    describe '#state' do
      it 'should return :draw' do
        expect(game_draw.state).to eq(:draw)
      end
    end
  end
end
