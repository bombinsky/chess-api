# frozen_string_literal: true

# Service object that performs promotion
class PerformPromotion
  include MovementService
  include PerformerService

  private

  delegate :moves, to: :game

  def create_history
    moves << Move.new(move_attributes)
    moves << Move.new(promoted_move_attributes)
  end

  def move_attributes
    {
      chessman: chessman,
      special_type: Move.special_types[:promotion],
      from: from,
      to: to
    }
  end

  def promoted_move_attributes
    {
      captured: captured,
      taken: taken,
      chessman_id: promoted.id,
      special_type: Move.special_types[:promotion],
      to: to,
      check: check?
    }
  end

  def update_board
    board.put_at(to, promoted)
    board.clear_at(from)
    board.save!
  end

  def set_taken
    @taken = board.chessman_at(to)
  end

  def captured
    to if taken
  end

  def promoted
    Queen.where(color: chessman.color).first
  end
end
