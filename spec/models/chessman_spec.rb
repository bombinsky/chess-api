# frozen_string_literal: true

describe Chessman do
  it { is_expected.to validate_presence_of :type }
  it { is_expected.to validate_presence_of :color }
  it { is_expected.to validate_presence_of(:symbol) }
  it { is_expected.to validate_inclusion_of(:color).in_array Chessman::COLORS }
  it { is_expected.to validate_inclusion_of(:symbol).in_array %w[P K Q B K R N p k q b k r n] }

  describe 'white?' do
    subject(:chessman) { described_class.new color: Chessman::WHITE }

    it { is_expected.to be_white }
  end

  describe 'black?' do
    subject(:chessman) { described_class.new color: Chessman::BLACK }

    it { is_expected.to be_black }
  end
end
