# frozen_string_literal: true

describe GameSerializer do
  subject(:serializer) { described_class.new(object) }

  let(:object) { build(:game) }

  it { is_expected.to have_attribute :id }
  it { is_expected.to have_attribute :created_at }
  it { is_expected.to have_attribute :mate }
  it { is_expected.to have_attribute :stalemate }
  it { is_expected.to have_attribute :whose_round }

  it { is_expected.to have_association :board }
  it { is_expected.to have_association :creator }
  it { is_expected.to have_association :white_player }
  it { is_expected.to have_association :black_player }
  it { is_expected.to have_association :moves }

  describe '#whose_round' do
    subject(:whose_round) { serializer.whose_round }

    it { is_expected.to eq object.whose_round? }
  end
end
