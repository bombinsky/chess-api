# frozen_string_literal: true

# Service object that detect if movement is a promotion
class IsPromotion
  include MovementService

  def call
    pawn? && from_promotion_row? && to_promotion_row?
  end

  private

  def from_promotion_row?
    from_row == chessman.promotion_row
  end

  def to_promotion_row?
    to_row == chessman.promotion_row + chessman.vector
  end

  def pawn?
    chessman.is_a? Pawn
  end

  def from_row
    from.to_s.last.to_i
  end

  def to_row
    to.to_s.last.to_i
  end
end
