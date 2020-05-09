# frozen_string_literal: true

describe ProtectsKing do
  describe '#call' do
    subject(:service_call) { described_class.new(game, from, to).call }

    let(:board) { create :board, :white_rook_protect_king }
    let(:game) { board.game }
    let(:to) { :A4 }

    context 'when chessman protect king' do
      let(:from) { :D4 }

      it { is_expected.to be_truthy }

      it 'does not change board' do
        expect { service_call }.not_to change(board, :chessmen)
      end
    end

    context 'when chessman does not protect king' do
      let(:from) { :B2 }

      it { is_expected.to be_falsey }
    end
  end
end
