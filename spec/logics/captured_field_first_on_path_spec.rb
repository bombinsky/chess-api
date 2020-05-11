# frozen_string_literal: true

describe CapturedFieldFirstOnPath do
  describe '#call' do
    subject(:service_call) { described_class.new(game, :E5, movement).call }

    let(:game) { board.game }

    context 'when queen from E5' do
      let(:board) { build :board, :white_queen_vs_black_pawns }

      {
        ne: :G7,
        n: :E7,
        nw: :C7,
        w: :A5,
        sw: :B2,
        s: :E2,
        se: :H2,
        e: :H5
      }.each do |movement, field|
        context "when movement is #{ movement }" do
          let(:movement) { movement }

          it { is_expected.to eq field }
        end
      end
    end
  end
end
