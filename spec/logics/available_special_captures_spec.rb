# frozen_string_literal: true

describe AvailableSpecialCaptures do
  describe '#call' do
    subject(:service_call) { described_class.new(game, field).call }

    let(:game) { board.game }
    let(:chessman) { build :black_pawn }
    let(:board) { build :board, :white_beating_in_pass }
    let(:field) { :C5 }

    before { allow(game).to receive(:last_move).and_return last_move }

    context 'when last opponent move was pawn first move' do
      let(:last_move) { build :move, :black_pawn_first_move }

      it { is_expected.to eq [:D6] }
    end

    context 'when opponent move was not pawn first move' do
      let(:last_move) { build :move, :black_king_move_back }

      it { is_expected.to eq [] }
    end
  end
end
