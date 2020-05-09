# frozen_string_literal: true

# Represents knight
class Knight < Chessman
  CONTINUOUS_MOVEMENTS = false

  def movements
    [
      [Movement::NORTH, Movement::NORTH_EAST],
      [Movement::NORTH, Movement::NORTH_WEST],
      [Movement::SOUTH, Movement::SOUTH_EAST],
      [Movement::SOUTH, Movement::SOUTH_WEST],
      [Movement::EAST,  Movement::NORTH_EAST],
      [Movement::EAST,  Movement::SOUTH_EAST],
      [Movement::WEST,  Movement::NORTH_WEST],
      [Movement::WEST,  Movement::SOUTH_WEST]
    ]
  end
end
