# frozen_string_literal: true

# Service object that performs castle
class PerformCastle
  include MovementService
  include PerformerService

  private

  alias king chessman

  delegate :moves, to: :game

  def create_history
    moves << Move.new(king_move_attributes)
    moves << Move.new(rook_move_attributes)
  end

  def king_move_attributes
    {
      chessman_id: king.id,
      from: from,
      to: to,
      special_type: Move.special_types[:castle]
    }
  end

  def rook_move_attributes
    {
      chessman_id: rook.id,
      from: rook_from,
      to: rook_to,
      check: check?,
      special_type: Move.special_types[:castle]
    }
  end

  def update_board
    board.update!(board_attributes)
  end

  def board_attributes
    {
      "#{ to }_id" => king.id,
      "#{ from }_id" => nil,
      "#{ rook_to }_id" => rook.id,
      "#{ rook_from }_id" => nil
    }
  end

  def rook
    @rook ||= chessman_at(rook_from)
  end

  def rook_from
    Hash[G1: :H1, G8: :H8, C1: :A1, C8: :A8][to]
  end

  def rook_to
    Hash[G1: :F1, G8: :F8, C1: :D1, C8: :D8][to]
  end

  def set_taken_id
    nil
  end
end
