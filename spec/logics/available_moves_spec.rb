# frozen_string_literal: true

describe AvailableMoves do
  describe '#call' do
    subject(:service_call) { described_class.new(game, field).call }

    let(:game) { board.game }

    context 'when chessman movements are continuous' do
      let(:board) { build :board, :white_queen_vs_black_pawns }
      let(:field) { :E5 }
      let(:expected_array) do
        %i[E6 E4 E3 F5 G5 D5 C5 B5 F6 D6 F4 G3 D4 C3]
      end

      it { is_expected.to eq expected_array }
    end

    context 'when chessman is one field slugger' do
      let(:board) { build :board, :two_kings_and_two_pawns }
      let(:field) { :E4 }

      it { is_expected.to eq %i[E5 E3 F4 D4 D5 F3 D3] }
    end

    context 'when chessman movement is composite move' do
      let(:board) { build :board, :white_knight_and_three_pawns }
      let(:field) { :E3 }

      it { is_expected.to eq %i[F1 D1 G4 G2 C2] }
    end
  end
end
