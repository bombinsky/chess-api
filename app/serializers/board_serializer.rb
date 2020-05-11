# frozen_string_literal: true

# Serializes board
class BoardSerializer < ActiveModel::Serializer
  attributes :chessmen

  def chessmen
    Board::FIELDS.each_with_object({}) do |field, result|
      chessman = object.chessman_at(field)
      result[field] = chessman.symbol if chessman.present?
    end.compact
  end
end
