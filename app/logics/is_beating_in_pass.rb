# frozen_string_literal: true

# Service object that detect if pawn uses beating in pass
class IsBeatingInPass
  include MovementService
  include BeatingInPass

  def call
    pawn? && slantwise? && chessman_in_position? && to_field_is_free?
  end

  private

  def chessman_current_row
    from.to_s.last.to_i
  end

  def to_field_is_free?
    !chessman_at(to)
  end

  def slantwise?
    from_col != to_col
  end

  def pawn?
    chessman.is_a? Pawn
  end

  def from_col
    from.to_s.first
  end

  def to_col
    to.to_s.first
  end
end
