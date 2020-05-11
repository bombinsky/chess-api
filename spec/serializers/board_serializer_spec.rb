# frozen_string_literal: true

describe BoardSerializer do
  context 'when board is empty' do
    subject(:serializer) { described_class.new(board) }

    context 'when empty board' do
      let(:board) { build(:board) }

      it { is_expected.to have_attributes chessmen: {} }
    end

    context 'when three pawns on board' do
      let(:board) { build(:board, :three_pawns) }

      it { is_expected.to have_attributes chessmen: { D5: 'p', E4: 'P', F5: 'P' } }
    end
  end
end
