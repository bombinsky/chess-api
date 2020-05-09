# frozen_string_literal: true

# Serializes game
class GameSerializer < ActiveModel::Serializer
  attributes :id,
             :creator_id,
             :white_player_id,
             :black_player_id,
             :created_at,
             :updated_at,
             :mate,
             :stalemate,
             :whose_round?

  has_one :board
  has_many :moves
end
