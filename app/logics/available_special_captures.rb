# frozen_string_literal: true

# Service object that returns array of available special captures
class AvailableSpecialCaptures
  include FieldService

  def call
    special_movements_fields(chessman.special_captures)
  end
end
