# frozen_string_literal: true

describe 'Fools mate game' do
  moves = {
    F2: :F3,
    E7: :E5,
    G2: :G4,
    D8: :H4
  }.freeze

  let(:game) { CreateGame.new(creator: create(:user), white_player: create(:user), black_player: create(:user)).call }

  before do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
    LoadChessmen.new.call

    move_nr = 0
    moves.each do |from, to|
      puts "\n#{ move_nr += 1 }. #{ game.whose_round?.capitalize } move from #{ from } to #{ to }" if ENV['DRAW_BOARD']
      MoveChessman.new(game, from, to).call
      DrawBoard.new(game.board).call if ENV['DRAW_BOARD']
    end
  end

  it 'makes black player a winner' do
    expect(game.whose_won?).to eq game.black_player
  end
end
