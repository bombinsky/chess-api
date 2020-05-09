# frozen_string_literal: true

FactoryBot.define do
  factory :move do
    game
    association :chessman, factory: :pawn, color: Chessman::BLACK
    from { :D7 }
    to { :D5 }

    trait :black_pawn_first_move do
      association :chessman, factory: :pawn, color: Chessman::BLACK
      from { :D7 }
      to { :D5 }
    end

    trait :black_king_move_back do
      association :chessman, factory: :king, color: Chessman::BLACK
      from { :E3 }
      to { :E4 }
    end

    trait :white_queen_to_c7 do
      association :chessman, factory: :queen, color: Chessman::WHITE
      from { :C2 }
      to { :C7 }
    end

    trait :promotion do
      association :chessman, factory: :pawn, color: Chessman::WHITE
      from { :A7 }
      to { :A8 }
      special_type { :promotion }
    end
  end
end
