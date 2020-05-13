# frozen_string_literal: true

# Represents game
class Game < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  belongs_to :white_player, class_name: 'User', foreign_key: :white_player_id
  belongs_to :black_player, class_name: 'User', foreign_key: :black_player_id
  has_one :board
  has_many :moves

  validates :creator, presence: true
  validates :white_player, presence: true
  validates :black_player, presence: true

  delegate :check?, to: :last_move, allow_nil: true

  def next_player
    send(:"#{ whose_round? }_player")
  end

  def whose_round?
    if last_move.blank? || last_move.chessman.color == Chessman::BLACK
      Chessman::WHITE
    else
      Chessman::BLACK
    end
  end

  def whose_won?
    return send(:"#{ Chessman::BLACK }_player") if mate? || whose_round? == Chessman::WHITE
    return send(:"#{ Chessman::WHITE }_player") if mate? || whose_round? == Chessman::BLACK
  end

  def last_move
    moves.last
  end

  def mate!
    update! mate: true
  end

  def mate
    update mate: true
  end

  def stalemate!
    update! stalemate: true
  end

  def stalemate
    update stalemate: true
  end
end
