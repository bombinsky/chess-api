# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    game

    trait :three_pawns do
      association :E4, factory: :pawn, color: :white
      association :F5, factory: :pawn, color: :white
      association :D5, factory: :pawn, color: :black
    end

    trait :five_pawns_two_with_special_moves do
      three_pawns
      association :A2, factory: :pawn, color: :white
      association :A7, factory: :pawn, color: :black
    end

    trait :two_kings_and_two_pawns do
      association :A5, factory: :pawn, color: :white
      association :A8, factory: :pawn, color: :black
      association :E4, factory: :king, color: :white
      association :F5, factory: :king, color: :black
    end

    trait :white_queen_vs_black_pawns do
      association :E5, factory: :queen, color: :white
      association :G7, factory: :pawn, color: :black
      association :E7, factory: :pawn, color: :black
      association :C7, factory: :pawn, color: :black
      association :A5, factory: :pawn, color: :black
      association :B2, factory: :pawn, color: :black
      association :E2, factory: :pawn, color: :black
      association :H2, factory: :pawn, color: :black
      association :H5, factory: :pawn, color: :black
    end

    trait :white_knight_and_three_pawns do
      association :E3, factory: :knight, color: :white
      association :F5, factory: :pawn, color: :black
      association :D5, factory: :pawn, color: :black
      association :C4, factory: :pawn, color: :white
    end

    trait :white_rook_protect_king do
      association :A7, factory: :bishop, color: :black
      association :D4, factory: :rook, color: :white
      association :E3, factory: :king, color: :white
      association :B2, factory: :queen, color: :white
      association :F8, factory: :king, color: :black
      association :A1, factory: :rook, color: :white
    end

    trait :white_king_castle do
      association :E1, factory: :king, color: :white
      association :A1, factory: :rook, color: :white
      association :F8, factory: :queen, color: :black
    end

    trait :white_king_long_castle_possible_check do
      white_king_castle
      association :D8, factory: :king, color: :black
    end

    trait :white_king_long_castle_possible do
      white_king_castle
      association :E8, factory: :king, color: :black
    end

    trait :black_king_short_castle_possible do
      association :E8, factory: :king, color: :black
      association :H8, factory: :rook, color: :black
      association :E1, factory: :king, color: :white
      association :C2, factory: :queen, color: :white
    end

    trait :rook_castle_path_not_clear do
      association :E8, factory: :king, color: :black
      association :A8, factory: :rook, color: :black
      association :B8, factory: :knight, color: :white
    end

    trait :white_rook_castle_path_not_clear do
      association :E1, factory: :king, color: :black
      association :A1, factory: :rook, color: :black
      association :B1, factory: :knight, color: :white
    end

    trait :white_beating_in_pass do
      association :C5, factory: :pawn, color: :white
      association :D5, factory: :pawn, color: :black
      association :E1, factory: :king, color: :white
      association :E8, factory: :king, color: :black
    end

    trait :white_beating_in_pass_check do
      association :C5, factory: :pawn, color: :white
      association :D5, factory: :pawn, color: :black
      association :E1, factory: :king, color: :white
      association :E7, factory: :king, color: :black
    end

    trait :white_beating_in_pass_check_mate do
      white_beating_in_pass_check
      association :G6, factory: :queen, color: :white
      association :C8, factory: :queen, color: :white
    end

    trait :white_promotion do
      association :C7, factory: :pawn, color: :white
      association :E1, factory: :king, color: :white
      association :H8, factory: :king, color: :black
      association :G6, factory: :queen, color: :white
    end

    trait :white_promotion_with_mate do
      white_promotion
      association :B8, factory: :rook, color: :black
    end

    trait :white_promotion_without_mate do
      white_promotion
      association :E8, factory: :rook, color: :black
    end

    trait :black_check_mate do
      association :H8, factory: :king, color: :black
      association :A1, factory: :queen, color: :black
      association :C7, factory: :queen, color: :white
      association :E1, factory: :king, color: :white
      association :G7, factory: :queen, color: :white
      association :H1, factory: :rook, color: :white
      association :D1, factory: :rook, color: :white
    end

    trait :black_stalemate do
      association :H8, factory: :king, color: :black
      association :A5, factory: :pawn, color: :black
      association :A4, factory: :pawn, color: :white
      association :C7, factory: :queen, color: :white
      association :G6, factory: :queen, color: :white
      association :E1, factory: :king, color: :white
    end
  end
end
