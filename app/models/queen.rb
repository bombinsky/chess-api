# frozen_string_literal: true

# Represents queen
class Queen < Chessman
  CONTINUOUS_MOVEMENTS = true

  def movements
    Movement::STRAIGHT + Movement::SLANTWISE
  end
end
