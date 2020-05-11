# frozen_string_literal: true

describe MoveSerializer do
  subject(:serializer) { described_class.new(object) }

  let(:object) { build(:move) }

  it { is_expected.to have_attribute :created_at }
  it { is_expected.to have_attribute :from }
  it { is_expected.to have_attribute :to }
  it { is_expected.to have_attribute :captured }
  it { is_expected.to have_attribute :special_type }
  it { is_expected.to have_attribute :chessman }

  describe '#chessman' do
    subject(:chessman) { serializer.chessman }

    it { is_expected.to eq object.chessman.symbol }
  end
end
