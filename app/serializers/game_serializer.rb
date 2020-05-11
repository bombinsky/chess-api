# frozen_string_literal: true

# Serializes game
class GameSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :mate, :stalemate, :whose_round

  has_one :creator
  has_one :white_player
  has_one :black_player
  has_one :board
  has_many :moves

  def whose_round
    object.whose_round?
  end
end
