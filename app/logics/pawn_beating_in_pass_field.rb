# frozen_string_literal: true

# Service object that determine what will be the field to make beating in pass
class PawnBeatingInPassField
  include FieldService
  include BeatingInPass

  def call
    [beating_in_pass_field] if beating_in_pass_possible?
  end

  private

  delegate :last_move, to: :game

  def beating_in_pass_possible?
    BeatingInPassPossible.new(game, field).call
  end

  def beating_in_pass_field
    "#{ col }#{ row }".to_sym
  end

  def col
    last_move.to_col
  end
end
