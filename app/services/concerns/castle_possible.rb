# frozen_string_literal: true

# Module with shared methods needed to detect whether castle is possible
module CastlePossible
  extend ActiveSupport::Concern

  def call
    both_present? && rook_path_is_free? && never_touched? && not_checked? && king_path_not_attacked?
  end

  private

  def king_path_not_attacked?
    (king_path & opponent_moves).blank?
  end

  def opponent_moves
    opponents.reduce([]) do |res, opponent|
      res << AvailableMoves.new(game, opponent.keys.first).call
    end
  end

  def opponents
    @opponents ||= board.public_send king.opponent_color
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
    @king ||= board.public_send King.new(color: color).start_field
  end

  def rook
    @rook ||= board.public_send send("#{ color }_rook_field".to_sym)
  end

  def rook_path
    send("#{ color }_rook_path".to_sym)
  end

  def color
    @color ||= board.public_send(field).color
  end

  def rook_path_is_free?
    rook_path.all? { |field| board.public_send(field).blank? }
  end
end
