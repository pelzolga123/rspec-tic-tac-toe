# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  let(:player) { Player.new('X', 'Olga') }
  let(:player_no_name) { Player.new('O') }

  context 'when a new player is created' do
    it 'should be an instance of player' do
      expect(player).to be_a(Player)
    end

    it 'should have the attributes :name and :marker as strings' do
      expect(player).to have_attributes(name: 'Olga', marker: 'X')
    end
  end

  context 'when a new player is created without a name' do
    it "should return the default player name 'Player' as a string" do
      expect(player_no_name).to have_attributes(name: 'Player', marker: 'O')
    end

    it 'should be able to set and return the player name as a string' do
      player_no_name.name = 'Mike'
      expect(player_no_name).to have_attributes(name: 'Mike', marker: 'O')
    end
  end
end
