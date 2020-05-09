# frozen_string_literal: true

# Service object that collect all available moves for chessman located on field
class CorrectMoves
  include FieldService

  def call
    available_captures + available_moves + available_special_moves + available_special_captures
  end

  private

  def available_captures
    AvailableCaptures.new(game, field).call
  end

  def available_moves
    AvailableMoves.new(game, field).call
  end

  def available_special_moves
    AvailableSpecialMoves.new(game, field).call
  end

  def available_special_captures
    AvailableSpecialCaptures.new(game, field).call
  end
end
