# frozen_string_literal: true

# Defines movements constants
module Movement
  NORTH = :n
  SOUTH = :s
  EAST = :e
  WEST = :w
  NORTH_EAST = :ne
  NORTH_WEST = :nw
  SOUTH_EAST = :se
  SOUTH_WEST = :sw
  FIRST_MOVE = :first_move
  SHORT_CASTLE = :short_castle
  LONG_CASTLE = :long_castle
  BEATING_IN_PASS = :beating_in_pass
  SLANTWISE = [NORTH_EAST, NORTH_WEST, SOUTH_EAST, SOUTH_WEST].freeze
  STRAIGHT = [NORTH, SOUTH, EAST, WEST].freeze
end
