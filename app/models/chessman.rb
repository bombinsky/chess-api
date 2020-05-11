# frozen_string_literal: true

# Abstracts some chessmen properties and methods
class Chessman < ApplicationRecord
  WHITE = 'white'
  BLACK = 'black'
  COLORS = [WHITE, BLACK].freeze

  SYMBOLS = {
    white: { Pawn: :P, King: :K, Queen: :Q, Bishop: :B, Knight: :K, Rook: :R },
    black: { Pawn: :p, King: :k, Queen: :q, Bishop: :b, Knight: :k, Rook: :r }
  }.freeze

  validates :type, presence: true
  validates :color, presence: true, inclusion: { in: COLORS }

  def movements
    raise NotImplementedError, 'Implement public method in a child class'
  end

  def captures
    movements
  end

  def white?
    color == WHITE
  end

  def black?
    color == BLACK
  end

  def opponent_color
    white? ? BLACK : WHITE
  end

  def special_moves
    []
  end

  def special_captures
    []
  end
end
