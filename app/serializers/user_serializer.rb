# frozen_string_literal: true

# Serializes board
class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname
end
