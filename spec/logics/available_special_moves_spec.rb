# frozen_string_literal: true

describe AvailableSpecialMoves do
  describe '#call' do
    subject(:service_call) { described_class.new(game, field).call }

    let(:game) { board.game }

    context 'when pawns' do
      let(:board) { build :board, :five_pawns_two_with_special_moves }

      context 'when there is no special move' do
        let(:field) { :E4 }

        it { is_expected.to eq [] }
      end

      context 'when white with special move' do
        let(:field) { :A2 }

        it { is_expected.to eq [:A4] }
      end

      context 'when black with special move' do
        let(:field) { :A7 }

        it { is_expected.to eq [:A5] }
      end
    end

    context 'when long castle is possible' do
      let(:board) { build :board, :white_king_long_castle_possible }
      let(:field) { :E1 }

      it { is_expected.to eq [:C1] }
    end

    context 'when short castle is possible' do
      let(:board) { build :board, :black_king_short_castle_possible }
      let(:field) { :E8 }

      it { is_expected.to eq [:G8] }
    end
  end
end
