# frozen_string_literal: true

# Service object that detect if capture happened
class IsCapture
  include MovementService

  def call
    attacker.present? && attacked.present? && opponents?
  end

  private

  alias attacker chessman

  def attacked
    @attacked ||= board.public_send to
  end

  def opponents?
    attacker.color != attacked.color
  end
end
