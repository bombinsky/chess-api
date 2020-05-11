# frozen_string_literal: true

# Service object that returns array of fields which can be captured
class AvailableCaptures
  include FieldService

  def call
    available_captures.compact
  end

  private

  def available_captures
    chessman.captures.reduce([]) do |res, capture|
      res << CapturedField.new(game, field, capture).call
    end
  end
end
