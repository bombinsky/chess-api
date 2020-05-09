# frozen_string_literal: true

describe IsMate do
  describe '#call' do
    subject(:service_call) { described_class.new(game).call }

    let!(:board) { build :board, :black_check_mate }
    let(:game) { board.game }

    before { allow(game).to receive(:whose_round?).and_return 'black' }

    context 'when black mate' do
      it { is_expected.to be_truthy }

      it 'does not change board' do
        expect { service_call }.not_to change(board, :chessmen)
      end
    end
  end
end
