# frozen_string_literal: true

# Service object that collect free fields matches to chessman movements
class FreeFields
  include VectorService

  def call
    if chessman.is_a? Knight
      [final_field] if final_field_free?
    elsif chessman.class::CONTINUOUS_MOVEMENTS
      free_fields_on_path
    elsif !movement.is_a? Symbol
      composite_movement_fields
    elsif next_field_free?
      [next_field]
    end
  end

  private

  def composite_movement_fields
    CompositeMovementFields.new(game, from, movement).call
  end

  def free_fields_on_path
    FreeFieldsOnPath.new(game, from, movement).call
  end

  def final_field_free?
    final_field.present? && board.public_send(final_field).blank?
  end

  def next_field_free?
    next_field.present? && board.public_send(next_field).blank?
  end

  def next_field
    @next_field ||= NextField.new(from, movement).call
  end

  def final_field
    @final_field ||= pass_to_final_field
  end
end
