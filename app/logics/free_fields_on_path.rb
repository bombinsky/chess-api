# frozen_string_literal: true

# Service object that collect free fields on path of chessman allowed to continuous movement
class FreeFieldsOnPath
  include VectorService

  def call
    free_fields = []
    field = NextField.new(from, movement).call

    while movement_possible?(field)
      free_fields << field
      field = NextField.new(field, movement).call
    end
    free_fields
  end

  private

  def movement_possible?(field)
    field.present? && !chessman_at(field)
  end
end
