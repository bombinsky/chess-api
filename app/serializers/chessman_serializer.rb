# frozen_string_literal: true

# Serializes any chessman
class ChessmanSerializer < ActiveModel::Serializer
  attributes :type, :color
end
