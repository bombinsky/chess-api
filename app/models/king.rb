# frozen_string_literal: true

# Represents king
class King < Chessman
  CONTINUOUS_MOVEMENTS = false

  def movements
    Movement::STRAIGHT + Movement::SLANTWISE
  end

  def special_moves
    [Movement::SHORT_CASTLE, Movement::LONG_CASTLE]
  end

  def short_castle_path
    white? ? %i[E1 F1 G1] : %i[E8 F8 G8]
  end

  def long_castle_path
    white? ? %i[E1 D1 C1] : %i[E8 D8 C8]
  end

  def start_field
    white? ? :E1 : :E8
  end

  def long_castle_field
    long_castle_path.last
  end

  def short_castle_field
    short_castle_path.last
  end
end
