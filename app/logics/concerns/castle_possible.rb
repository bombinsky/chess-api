# frozen_string_literal: true

# Module with shared methods needed to detect whether castle is possible
module CastlePossible
  extend ActiveSupport::Concern

  def call
    both_present? && rook_path_is_free? && never_touched? && not_checked? && king_path_not_attacked?
  end

  private

  delegate :chessman_at, :opponents, to: :board

  def king_path_not_attacked?
    (king_path & opponent_moves).blank?
  end

  def opponent_moves
    opponents(king.color).reduce([]) do |res, opponent|
      res << AvailableMoves.new(game, opponent.keys.first).call
    end
  end

  def not_checked?
    !IsCheck.new(game, field).call
  end

  def both_present?
    king.present? && rook.present?
  end

  def never_touched?
    game.moves.find_by_chessman_id([king.id, rook.id]).blank?
  end

  def king
    @king ||= chessman_at(King.new(color: color).start_field)
  end

  def rook
    @rook ||= chessman_at(send("#{ color }_rook_field".to_sym))
  end

  def rook_path
    send("#{ color }_rook_path".to_sym)
  end

  def color
    @color ||= chessman_at(field).color
  end

  def rook_path_is_free?
    rook_path.all? { |field| !chessman_at(field) }
  end
end
