# frozen_string_literal: true

FactoryBot.define do
  factory :move do
    game
    association :chessman, factory: :black_pawn
    from { :D7 }
    to { :D5 }

    trait :black_pawn_first_move do
      association :chessman, factory: :black_pawn
      from { :D7 }
      to { :D5 }
    end

    trait :black_king_move_back do
      association :chessman, factory: :black_king
      from { :E3 }
      to { :E4 }
    end

    trait :white_queen_to_c7 do
      association :chessman, factory: :white_queen
      from { :C2 }
      to { :C7 }
    end

    trait :promotion do
      association :chessman, factory: :white_pawn
      from { :A7 }
      to { :A8 }
      special_type { :promotion }
    end
  end
end
