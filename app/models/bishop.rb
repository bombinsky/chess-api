# frozen_string_literal: true

# Represents bishop
class Bishop < Chessman
  CONTINUOUS_MOVEMENTS = true

  def movements
    Movement::SLANTWISE
  end
end
