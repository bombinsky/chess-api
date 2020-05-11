# frozen_string_literal: true

FactoryBot.define do
  factory :chessman do
    color { Chessman::WHITE }
    type { 'Pawn' }
    symbol { 'P' }

    factory :white_pawn, class: 'Pawn', parent: :chessman do
      color { Chessman::WHITE }
      type { 'Pawn' }
      symbol { 'P' }
    end

    factory :white_bishop, class: 'Bishop', parent: :chessman do
      color { Chessman::WHITE }
      type { 'Bishop' }
      symbol { 'B' }
    end

    factory :white_king, class: 'King', parent: :chessman do
      color { Chessman::WHITE }
      type { 'King' }
      symbol { 'K' }
    end

    factory :white_knight, class: 'Knight', parent: :chessman do
      color { Chessman::WHITE }
      type { 'Knight' }
      symbol { 'N' }
    end

    factory :white_queen, class: 'Queen', parent: :chessman do
      color { Chessman::WHITE }
      type { 'Queen' }
      symbol { 'Q' }
    end

    factory :white_rook, class: 'Rook', parent: :chessman do
      color { Chessman::WHITE }
      type { 'Rook' }
      symbol { 'R' }
    end

    factory :black_pawn, class: 'Pawn', parent: :chessman do
      color { Chessman::BLACK }
      type { 'Pawn' }
      symbol { 'p' }
    end

    factory :black_bishop, class: 'Bishop', parent: :chessman do
      color { Chessman::BLACK }
      type { 'Bishop' }
      symbol { 'b' }
    end

    factory :black_king, class: 'King', parent: :chessman do
      color { Chessman::BLACK }
      type { 'King' }
      symbol { 'k' }
    end

    factory :black_knight, class: 'Knight', parent: :chessman do
      color { Chessman::BLACK }
      type { 'Knight' }
      symbol { 'n' }
    end

    factory :black_queen, class: 'Queen', parent: :chessman do
      color { Chessman::BLACK }
      type { 'Queen' }
      symbol { 'q' }
    end

    factory :black_rook, class: 'Rook', parent: :chessman do
      color { Chessman::BLACK }
      type { 'Rook' }
      symbol { 'r' }
    end
  end
end
