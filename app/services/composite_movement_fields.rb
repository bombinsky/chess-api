# frozen_string_literal: true

# Service object responsible for detect fields of composite movement
class CompositeMovementFields
  include VectorService

  def call
    composite_movement_fields
  end

  private

  def composite_movement_fields
    field = from
    movement.reduce([]) do |result, move_step|
      field = NextField.new(field, move_step).call
      return result unless movement_possible?(field)

      result << field
    end
  end

  def movement_possible?(field)
    field.present? && board.public_send(field).blank?
  end
end
