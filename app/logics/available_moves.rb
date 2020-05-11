# frozen_string_literal: true

# Service object that returns array of free fields on the board
class AvailableMoves
  include FieldService

  def call
    possible_fields = []
    chessman.movements.each do |move|
      possible_fields += free_fields(move).to_a
    end
    possible_fields.uniq
  end

  private

  def free_fields(move)
    FreeFields.new(game, field, move).call
  end
end
