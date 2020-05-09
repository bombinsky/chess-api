# frozen_string_literal: true

FactoryBot.define do
  factory :chessman do
    color { Chessman::WHITE }
    type { 'Pawn' }

    factory :pawn, class: 'Pawn', parent: :chessman do
      type { 'Pawn' }
    end

    factory :bishop, class: 'Bishop', parent: :chessman do
      type { 'Bishop' }
    end

    factory :king, class: 'King', parent: :chessman do
      type { 'King' }
    end

    factory :knight, class: 'Knight', parent: :chessman do
      type { 'Knight' }
    end

    factory :queen, class: 'Queen', parent: :chessman do
      type { 'Queen' }
    end

    factory :rook, class: 'Rook', parent: :chessman do
      type { 'Rook' }
    end
  end
end
