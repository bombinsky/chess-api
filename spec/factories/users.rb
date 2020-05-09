# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:nickname) { |i| "nickname-#{ i }" }
    sequence(:email) { |i| "user-#{ i }@test.com" }
  end
end
