require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'

describe Game do

    let(:game) {Game.new}
    let(:board) {Board.new}
     
   context 'test game methods' do
    it 'test if switch_player will change player' do
        initial_player = game.current_player
        game.switch_player
        expect(game.current_player).not_to eq(initial_player)
    end

    it 'check if board is created correctly' do
        expect(game.board).to be_a (Board)
    end

    it 'just testing' do
        allow(game).to receive("It's a draw!").and_return(board.draw)
    end    
   end 

end