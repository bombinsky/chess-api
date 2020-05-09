# frozen_string_literal: true

describe User do
  subject(:user) { create :user }

  it { is_expected.to validate_presence_of :nickname }
  it { is_expected.to validate_uniqueness_of :nickname }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of :email }
end
