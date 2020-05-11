# frozen_string_literal: true

# Service object that detects the field when capture happened
class CapturedField
  include VectorService

  def call
    if !movement.is_a?(Symbol)
      final_field if capture_on_final_field?
    elsif chessman.class::CONTINUOUS_MOVEMENTS
      first_field_on_path
    elsif capture_on_next_field?
      next_field
    end
  end

  private

  def first_field_on_path
    CapturedFieldFirstOnPath.new(game, from, movement).call
  end

  def capture_on_final_field?
    IsCapture.new(game, from, final_field).call if final_field.present?
  end

  def capture_on_next_field?
    IsCapture.new(game, from, next_field).call if next_field.present?
  end

  def next_field
    @next_field ||= NextField.new(from, movement).call
  end

  def final_field
    @final_field ||= pass_to_final_field
  end
end
