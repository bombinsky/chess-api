# frozen_string_literal: true

describe CreateMove do
  describe '#call' do
    subject(:service_call) { described_class.new(game, from, to).call }

    let(:board) { create :board, :white_rook_protect_king }
    let(:game) { board.game }
    let(:from) { 'C5' }
    let(:to) { 'D6' }

    context 'when from is nil' do
      let(:from) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when to to nil' do
      let(:to) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when from is invalid' do
      let(:from) { 'C9' }

      it { is_expected.not_to be_valid }
    end

    context 'when to is invalid' do
      let(:from) { 'Z8' }

      it { is_expected.not_to be_valid }
    end

    context 'when is properly called' do
      let(:from) { 'A1' }
      let(:to) { 'A7' }
      let(:expected_move) { build :move, from: from, to: to }

      before do
        allow_service_call(MoveChessman, with: [game, from.to_sym, to.to_sym], to_return: expected_move)
      end

      it 'returns expected result' do
        expect(service_call).to eq expected_move
      end

      it 'calls MoveChessman logic with symbols of the fields' do
        expect(MoveChessman).to receive_call.with(game, from.to_sym, to.to_sym)

        service_call
      end
    end
  end
end
