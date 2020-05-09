# frozen_string_literal: true

# Serializes move
class MoveSerializer < ActiveModel::Serializer
  attributes :created_at, :type, :color, :from, :to, :captured, :special_type

  def type
    object.chessman.type
  end

  def color
    object.chessman.color
  end
end
