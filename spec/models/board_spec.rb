# frozen_string_literal: true

describe Board do
  it { is_expected.to belong_to :game }
  it { is_expected.to validate_presence_of :game }
end
