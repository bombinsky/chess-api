# frozen_string_literal: true

describe BoardSerializer do
  context 'when board is empty' do
    subject(:serializer) { described_class.new(build(:board)) }

    let(:empty_board) { Board::FIELDS.reduce({}) { |attributes, e| attributes.merge(e => nil) } }

    it { is_expected.to have_attributes empty_board }
  end
end
