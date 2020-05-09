# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    association :creator, factory: :user
    association :white_player, factory: :user
    association :black_player, factory: :user
  end
end
