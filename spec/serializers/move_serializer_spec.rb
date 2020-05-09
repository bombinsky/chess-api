# frozen_string_literal: true

describe MoveSerializer do
  subject(:serializer) { described_class.new(build(:move)) }

  it { is_expected.to have_attribute :created_at }
  it { is_expected.to have_attribute :type }
  it { is_expected.to have_attribute :color }
  it { is_expected.to have_attribute :from }
  it { is_expected.to have_attribute :to }
  it { is_expected.to have_attribute :captured }
  it { is_expected.to have_attribute :special_type }
end
