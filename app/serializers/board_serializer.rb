# frozen_string_literal: true

# Serializes board
class BoardSerializer < ActiveModel::Serializer
  attributes Board::FIELDS

  Board::FIELDS.each do |field|
    define_method field do
      chessmen = object.public_send(field)
      ChessmanSerializer.new(chessmen) if chessmen
    end
  end
end
