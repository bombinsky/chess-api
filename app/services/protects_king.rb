# frozen_string_literal: true

# Service object that checks if try of the move protects king
class ProtectsKing
  include MovementService
  include ProbeService

  def call
    move_chessman
    check?.tap do
      put_chessman_back
    end
  end
end
