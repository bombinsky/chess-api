# frozen_string_literal: true

# Service object responsible for single move in a game
class MoveChessman
  include MovementService

  def call
    validate_move
    special_move? ? perform_special_move : perform_move
    update_game
    game.last_move
  end

  private

  def update_game
    if game.check?
      game.mate! if mate?
    elsif stalemate?
      game.stalemate!
    end
  end

  def special_move?
    castle? || beating_in_pass? || promotion?
  end

  def perform_special_move
    perform_castle if castle?
    perform_beating_in_pass if beating_in_pass?
    perform_promotion if promotion?
  end

  def perform_move
    PerformMove.new(game, from, to).call
  end

  def validate_move
    ValidateMove.new(game, from, to).call
  end

  def castle?
    @castle ||= chessman.is_a?(King) && IsCastle.new(game, from, to).call
  end

  def perform_castle
    PerformCastle.new(game, from, to).call
  end

  def beating_in_pass?
    @beating_in_pass ||= chessman.is_a?(Pawn) && IsBeatingInPass.new(game, from, to).call
  end

  def perform_beating_in_pass
    PerformBeatingInPass.new(game, from, to).call
  end

  def promotion?
    @promotion ||= chessman.is_a?(Pawn) && IsPromotion.new(game, from, to).call
  end

  def perform_promotion
    PerformPromotion.new(game, from, to).call
  end

  def mate?
    @mate ||= IsMate.new(game).call
  end

  def stalemate?
    @stalemate ||= IsMate.new(game).call
  end
end
