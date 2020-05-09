# frozen_string_literal: true

describe AvailableCaptures do
  describe '#call' do
    subject(:service_call) { described_class.new(game, field).call }

    let(:game) { board.game }

    context 'when chessman movements are continuous' do
      let(:board) { build :board, :white_queen_vs_black_pawns }
      let(:field) { :E5 }

      it { is_expected.to eq %i[E7 E2 H5 A5 G7 C7 H2 B2] }
    end

    context 'when chessman is one field slugger' do
      let(:board) { build :board, :three_pawns }
      let(:field) { :E4 }

      it { is_expected.to eq [:D5] }
    end

    context 'when chessman jumping' do
      let(:board) { build :board, :white_knight_and_three_pawns }
      let(:field) { :E3 }

      it { is_expected.to eq %i[F5 D5] }
    end
  end
end
