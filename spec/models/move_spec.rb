# frozen_string_literal: true

describe Move do
  it { is_expected.to belong_to :game }
  it { is_expected.to belong_to :chessman }
  it { is_expected.to belong_to(:taken).optional }
  it { is_expected.to validate_presence_of :to }
  it { is_expected.to validate_presence_of :from }

  context 'when promotion' do
    subject(:move) { build :move, :promotion }

    it { is_expected.not_to validate_presence_of :from }
  end
end
