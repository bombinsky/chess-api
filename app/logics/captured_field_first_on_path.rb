# frozen_string_literal: true

# Service object that detects the field when capture by chessman able to make continuous movement happened
class CapturedFieldFirstOnPath
  include VectorService

  def call
    @examined_field = next_field
    @examined_field = next_field while next_movement_possible?
    examined_field if capture?
  end

  private

  attr_reader :examined_field

  def next_field
    NextField.new(start_field, movement).call
  end

  def start_field
    examined_field || from
  end

  def next_movement_possible?
    examined_field.present? && attacked.blank?
  end

  def attacked
    chessman_at(examined_field)
  end

  def opponent?
    chessman.color != attacked.color
  end

  def capture?
    examined_field.present? && attacked.present? && opponent?
  end
end
