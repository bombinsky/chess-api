# frozen_string_literal: true

describe LongCastlePossible do
  describe '#call' do
    subject(:service_call) { described_class.new(game, field).call }

    let(:game) { board.game }

    context 'when white player' do
      let(:field) { :E1 }

      context 'when long castle is possible' do
        let(:board) { build :board, :white_king_long_castle_possible }

        it { is_expected.to be_truthy }
      end

      context 'when long castle is not possible' do
        let(:field) { :E8 }
        let(:board) { build :board, :rook_castle_path_not_clear }

        it { is_expected.to be_falsey }
      end

      context 'when white long castle is possible' do
        let(:board) { build :board, :white_king_long_castle_possible }
        let(:from) { :E1 }

        it { is_expected.to be_truthy }
      end
    end
  end
end
