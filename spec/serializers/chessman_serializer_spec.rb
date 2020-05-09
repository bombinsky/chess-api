# frozen_string_literal: true

describe ChessmanSerializer do
  subject(:serializer) { described_class.new(build(:chessman)) }

  it { is_expected.to have_attribute :type }
  it { is_expected.to have_attribute :color }
end
