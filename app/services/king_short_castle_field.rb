# frozen_string_literal: true

# Service object that determine what should be the field to make short castle
class KingShortCastleField
  include FieldService

  def call
    [chessman.short_castle_field] if short_castle_possible
  end

  private

  def short_castle_possible
    ShortCastlePossible.new(game, field).call
  end
end
