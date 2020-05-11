# frozen_string_literal: true

describe FreeFieldsOnPath do
  describe '#call' do
    subject(:service_call) { described_class.new(game, :E5, movement).call.size }

    let(:game) { board.game }

    context 'when queen from E5', board: :white_queen_vs_black_pawns do
      let(:board) { build :board, :white_queen_vs_black_pawns }

      { ne: 1, n: 1, nw: 1, w: 3, sw: 2, s: 2, se: 2, e: 2 }.each do |m, qty|
        context "goes #{ m }" do
          let(:movement) { m }

          it { is_expected.to eq qty }
        end
      end
    end
  end
end
