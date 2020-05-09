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
      chessman_id: chessman.id,
      special_type: Move.special_types[:promotion],
      from: from,
      to: to
    }
  end

  def promoted_move_attributes
    {
      captured: captured,
      taken_id: taken_id,
      chessman_id: promoted.id,
      special_type: Move.special_types[:promotion],
      to: to,
      check: check?
    }
  end

  def update_board
    board.update! board_attributes
  end

  def board_attributes
    Hash["#{ to }_id" => promoted.id, "#{ from }_id" => nil]
  end

  def set_taken_id
    @taken_id = board.public_send "#{ to }_id".to_sym
  end

  def captured
    to if taken_id
  end

  def promoted
    Queen.where(color: chessman.color).first
  end
end
