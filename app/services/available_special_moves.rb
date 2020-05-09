# frozen_string_literal: true

# Service object that returns array of available special moves
class AvailableSpecialMoves
  include FieldService

  def call
    special_movements_fields(chessman.special_moves)
  end
end
