# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    game

    trait :three_pawns do
      association :E4, factory: :white_pawn
      association :F5, factory: :white_pawn
      association :D5, factory: :black_pawn
    end

    trait :five_pawns_two_with_special_moves do
      three_pawns
      association :A2, factory: :white_pawn
      association :A7, factory: :black_pawn
    end

    trait :two_kings_and_two_pawns do
      association :A5, factory: :white_pawn
      association :A8, factory: :black_pawn
      association :E4, factory: :white_king
      association :F5, factory: :black_king
    end

    trait :white_queen_vs_black_pawns do
      association :E5, factory: :white_queen
      association :G7, factory: :black_pawn
      association :E7, factory: :black_pawn
      association :C7, factory: :black_pawn
      association :A5, factory: :black_pawn
      association :B2, factory: :black_pawn
      association :E2, factory: :black_pawn
      association :H2, factory: :black_pawn
      association :H5, factory: :black_pawn
    end

    trait :white_knight_and_three_pawns do
      association :E3, factory: :white_knight
      association :F5, factory: :black_pawn
      association :D5, factory: :black_pawn
      association :C4, factory: :white_pawn
    end

    trait :white_rook_protect_king do
      association :A7, factory: :black_bishop
      association :D4, factory: :white_rook
      association :E3, factory: :white_king
      association :B2, factory: :white_queen
      association :F8, factory: :black_king
      association :A1, factory: :white_rook
    end

    trait :white_king_castle do
      association :E1, factory: :white_king
      association :A1, factory: :white_rook
      association :F8, factory: :black_queen
    end

    trait :white_king_long_castle_possible_check do
      white_king_castle
      association :D8, factory: :black_king
    end

    trait :white_king_long_castle_possible do
      white_king_castle
      association :E8, factory: :black_king
    end

    trait :black_king_short_castle_possible do
      association :E8, factory: :black_king
      association :H8, factory: :black_rook
      association :E1, factory: :white_king
      association :C2, factory: :white_queen
    end

    trait :rook_castle_path_not_clear do
      association :E8, factory: :black_king
      association :A8, factory: :black_rook
      association :B8, factory: :white_knight
    end

    trait :white_rook_castle_path_not_clear do
      association :E1, factory: :black_king
      association :A1, factory: :black_rook
      association :B1, factory: :white_knight
    end

    trait :white_beating_in_pass do
      association :C5, factory: :white_pawn
      association :D5, factory: :black_pawn
      association :E1, factory: :white_king
      association :E8, factory: :black_king
    end

    trait :white_beating_in_pass_check do
      association :C5, factory: :white_pawn
      association :D5, factory: :black_pawn
      association :E1, factory: :white_king
      association :E7, factory: :black_king
    end

    trait :white_beating_in_pass_check_mate do
      white_beating_in_pass_check
      association :G6, factory: :white_queen
      association :C8, factory: :white_queen
    end

    trait :white_promotion do
      association :C7, factory: :white_pawn
      association :E1, factory: :white_king
      association :H8, factory: :black_king
      association :G6, factory: :white_queen
    end

    trait :white_promotion_with_mate do
      white_promotion
      association :B8, factory: :black_rook
    end

    trait :white_promotion_without_mate do
      white_promotion
      association :E8, factory: :black_rook
    end

    trait :black_check_mate do
      association :H8, factory: :black_king
      association :A1, factory: :black_queen
      association :C7, factory: :white_queen
      association :E1, factory: :white_king
      association :G7, factory: :white_queen
      association :H1, factory: :white_rook
      association :D1, factory: :white_rook
    end

    trait :black_stalemate do
      association :H8, factory: :black_king
      association :A5, factory: :black_pawn
      association :A4, factory: :white_pawn
      association :C7, factory: :white_queen
      association :G6, factory: :white_queen
      association :E1, factory: :white_king
    end
  end
end
