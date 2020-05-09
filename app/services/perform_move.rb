# frozen_string_literal: true

# Service object that performs single move
class PerformMove
  include MovementService
  include PerformerService

  private

  def create_history
    game.moves << Move.new(move_attributes)
  end

  def move_attributes
    {
      captured: captured,
      taken_id: taken_id,
      chessman_id: chessman.id,
      from: from,
      to: to,
      check: check?
    }
  end

  def update_board
    board.update! board_attributes
  end

  def board_attributes
    { "#{ to }_id" => chessman.id, "#{ from }_id" => nil }
  end

  def set_taken_id
    @taken_id = board.public_send "#{ to }_id".to_sym
  end

  def captured
    to if taken_id
  end
end
