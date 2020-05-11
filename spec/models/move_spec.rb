# frozen_string_literal: true

describe Move do
  it { is_expected.to belong_to :game }
  it { is_expected.to belong_to :chessman }
  it { is_expected.to belong_to(:taken).optional }
  it { is_expected.to validate_presence_of :to }
  it { is_expected.to validate_presence_of :from }
  it { is_expected.to validate_inclusion_of(:to).in_array(Board::FIELDS.map(&:to_s)) }
  it { is_expected.to validate_inclusion_of(:from).in_array(Board::FIELDS.map(&:to_s)) }

  context 'when promotion' do
    subject(:move) { build :move, :promotion }

    it { is_expected.not_to validate_presence_of :from }
    it { is_expected.not_to validate_inclusion_of(:from).in_array(Board::FIELDS.map(&:to_s)) }
  end
end
