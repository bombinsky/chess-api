# frozen_string_literal: true

describe IsCheck do
  describe '#call' do
    subject(:service_call) { described_class.new(game, field).call }

    let(:game) { board.game }

    context 'when next move causes check' do
      let(:board) { build :board, :white_queen_vs_black_pawns }

      %i[E7 E2 H5 A5 G7 C7 H2 B2].each do |field|
        let(:field) { field }
      end

      it { is_expected.to be_truthy }
    end
  end
end
