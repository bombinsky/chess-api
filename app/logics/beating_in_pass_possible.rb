# frozen_string_literal: true

# Service object that checks whether beating in pass is possible
class BeatingInPassPossible
  include FieldService
  include BeatingInPass

  def call
    chessman_in_position? && opponent_used_special? && it_happened_in_next_column?
  end

  private

  delegate :last_move, to: :game

  def opponent_used_special?
    last_move_was_pawn? && last_move_was_special?
  end

  def it_happened_in_next_column?
    [chessman_previous_col, chessman_next_col].include? last_move.to_col
  end

  def last_move_was_pawn?
    last_move.chessman.is_a?(Pawn)
  end

  def last_move_was_special?
    last_move.to_row == chessman_current_row
  end

  def chessman_current_col
    field.to_s.first
  end

  def chessman_previous_col
    (chessman_current_col.ord - 1).chr
  end

  def chessman_next_col
    (chessman_current_col.ord + 1).chr
  end
end
