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
      taken: taken,
      chessman: chessman,
      special_type: Move.special_types[:beating_in_pass],
      from: from,
      to: to,
      check: check?
    }
  end

  def update_board
    board.put_at(to, chessman)
    board.clear_at(from)
    board.clear_at(last_move.to)
    board.save!
  end

  def set_taken
    @taken = last_move.chessman
  end

  def captured
    last_move.to
  end
end
