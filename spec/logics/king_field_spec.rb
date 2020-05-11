# frozen_string_literal: true

describe KingField do
  describe '#call' do
    let(:subject) { described_class.new(game, color).call }

    let(:board) { build :board, :two_kings_and_two_pawns }
    let(:game) { board.game }

    context 'when searching for white king' do
      let(:color) { Chessman::WHITE }

      it { is_expected.to eq :E4 }
    end

    context 'when searching for black king' do
      let(:color) { Chessman::BLACK }

      it { is_expected.to eq :F5 }
    end
  end
end
