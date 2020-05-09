# frozen_string_literal: true

# Serializes move
class MoveSerializer < ActiveModel::Serializer
  attributes :created_at, :from, :to, :captured, :special_type

  has_one :chessman
end
