# frozen_string_literal: true

# Service object that performs beating in pass
class PerformBeatingInPass
  include MovementService
  include PerformerService

  private

  delegate :last_move, to: :game

  def create_history
    game.moves << Move.new(move_attributes)
  end

  def move_attributes
    {
      captured: captured,
      taken_id: taken_id,
      chessman_id: chessman.id,
      special_type: Move.special_types[:beating_in_pass],
      from: from,
      to: to,
      check: check?
    }
  end

  def update_board
    board.update! board_attributes
  end

  def board_attributes
    {
      "#{ to }_id" => chessman.id,
      "#{ from }_id" => nil,
      "#{ last_move.to }_id" => nil
    }
  end

  def set_taken_id
    @taken_id = last_move.chessman_id
  end

  def captured
    last_move.to
  end
end
