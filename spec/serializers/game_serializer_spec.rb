# frozen_string_literal: true

describe GameSerializer do
  subject(:serializer) { described_class.new(build(:game)) }

  it { is_expected.to have_attribute :id }
  it { is_expected.to have_attribute :creator_id }
  it { is_expected.to have_attribute :white_player_id }
  it { is_expected.to have_attribute :black_player_id }
  it { is_expected.to have_attribute :created_at }
  it { is_expected.to have_attribute :updated_at }
  it { is_expected.to have_attribute :mate }
  it { is_expected.to have_attribute :stalemate }
  it { is_expected.to have_attribute :whose_round? }

  it { is_expected.to have_association :board }
  it { is_expected.to have_association :moves }
end
