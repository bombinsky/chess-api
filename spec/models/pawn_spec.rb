# frozen_string_literal: true

describe Pawn do
  describe '#movements' do
    subject(:chessman) { described_class.new.movements }

    it { is_expected.to be_an Array }
  end
end
