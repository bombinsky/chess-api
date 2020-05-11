# frozen_string_literal: true

# Service object that checks if move is possible
class CheckMove
  include MovementService

  def call
    raise WrongMove, 'no chessman in field' unless chessman.present?
    raise WrongMove, "now is #{ whose_round? } round" unless chessman_round?
    raise WrongMove, 'incorrect move' unless correct_move?
    raise WrongMove, 'check' if protects_king?
  end

  private

  delegate :whose_round?, to: :game

  def chessman_round?
    whose_round? == chessman.color
  end

  def protects_king?
    ProtectsKing.new(game, from, to).call
  end

  def correct_move?
    correct_moves.include? to
  end

  def correct_moves
    @correct_moves ||= CorrectMoves.new(game, from).call
  end
end
