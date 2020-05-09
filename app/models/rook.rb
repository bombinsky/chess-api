# frozen_string_literal: true

# Represents rook
class Rook < Chessman
  CONTINUOUS_MOVEMENTS = true

  def movements
    Movement::STRAIGHT
  end
end
