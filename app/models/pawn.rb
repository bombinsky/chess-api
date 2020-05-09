# frozen_string_literal: true

# Represents pawn
class Pawn < Chessman
  CONTINUOUS_MOVEMENTS = false

  def captures
    if white?
      [Movement::NORTH_EAST, Movement::NORTH_WEST]
    else
      [Movement::SOUTH_EAST, Movement::SOUTH_WEST]
    end
  end

  def movements
    white? ? [Movement::NORTH] : [Movement::SOUTH]
  end

  def special_captures
    [Movement::BEATING_IN_PASS]
  end

  def special_moves
    [Movement::FIRST_MOVE]
  end

  def beating_in_pass_row
    white? ? 5 : 4
  end

  def promotion_row
    white? ? 7 : 2
  end

  def vector
    white? ? 1 : -1
  end
end
