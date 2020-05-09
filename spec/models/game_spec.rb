# frozen_string_literal: true

describe Game do
  it { is_expected.to belong_to :creator }
  it { is_expected.to belong_to :white_player }
  it { is_expected.to belong_to :black_player }
  it { is_expected.to have_one :board }

  it { is_expected.to validate_presence_of :creator }
  it { is_expected.to validate_presence_of :white_player }
  it { is_expected.to validate_presence_of :black_player }
end
