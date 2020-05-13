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
      taken: taken,
      chessman: chessman,
      from: from,
      to: to,
      check: check?
    }
  end

  def update_board
    board.put_at(to, chessman)
    board.clear_at(from)
    board.save!
  end

  def set_taken
    @taken = board.chessman_at(to)
  end

  def captured
    to if taken
  end
end
