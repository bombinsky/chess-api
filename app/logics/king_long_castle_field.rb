# frozen_string_literal: true

# Service object that determine what should be the field to make long castle
class KingLongCastleField
  include FieldService

  def call
    [chessman.long_castle_field] if long_castle_possible
  end

  private

  def long_castle_possible
    LongCastlePossible.new(game, field).call
  end
end
