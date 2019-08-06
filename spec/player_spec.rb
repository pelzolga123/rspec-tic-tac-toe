# frozen_string_literal: true

require_relative '../lib/player'

RSpec.describe Player do
  before { @player_with_name = Player.new('X', 'Olga') }
  before { @player_without_name = Player.new('O') }

  describe 'Create Player' do
    it 'Should create a new instance of the Player class' do
      expect(@player_with_name).to be_a(Player)
    end

    # It can take one or two argument, marker and name
    # it 'Should take exactly 1 argument. (String: Player marker)' do
    #   expect
    # end

    it 'Returns player name as a string' do
      expect(@player_with_name.name).to eq('Olga')
    end

    it 'Returns player marker as a string' do
      expect(@player_with_name.marker).to eq('X')
    end

    it "Returns default player name 'Player' if name is not set" do
      expect(@player_without_name.name).to eq('Player')
    end

    it 'Set and return player name as a string when not initially set' do
      @player_without_name.name = 'Mike'
      expect(@player_without_name.name).to eq('Mike')
    end
  end
end
