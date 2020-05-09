# frozen_string_literal: true

# Service object that determine what will be the field to make first move of a pawn
class PawnFirstMoveField
  include FieldService

  def call
    return [white_pawn_first_move_last_field] if white_pawn_first_move?
    return [black_pawn_first_move_last_field] if black_pawn_first_move?
  end

  private

  def white_pawn_first_move_last_field
    FreeFields.new(game, field, [Movement::NORTH, Movement::NORTH]).call.last
  end

  def black_pawn_first_move_last_field
    FreeFields.new(game, field, [Movement::SOUTH, Movement::SOUTH]).call.last
  end

  def white_pawn_first_move?
    chessman.white? && current_row == 2
  end

  def black_pawn_first_move?
    chessman.black? && current_row == 7
  end

  def current_row
    @current_row ||= field.to_s.last.to_i
  end
end
