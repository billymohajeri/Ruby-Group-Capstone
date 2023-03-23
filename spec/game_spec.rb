require './Classes/item'
require './Classes/game'

RSpec.describe Game do
  let(:game) { Game.new(Time.new(2010, 1, 1), true, Time.new(2020, 1, 1)) }

  it 'returns false when can_be_archived? called for recent game' do
    game = Game.new(Time.now, true, Time.now)
    expect(game.can_be_archived?).to be false
  end

  it 'returns true when can_be_archived? called for old game' do
    expect(game.can_be_archived?).to be true
  end
end
