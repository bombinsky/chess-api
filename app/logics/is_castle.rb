# frozen_string_literal: true

# Service object that detect if movement is a castle
class IsCastle
  include MovementService

  def call
    king? && (short_castle_path? || long_castle_path?)
  end

  private

  delegate :short_castle_path, :long_castle_path, to: :chessman

  def short_castle_path?
    short_castle_path.first == from && short_castle_path.last == to
  end

  def long_castle_path?
    long_castle_path.first == from && long_castle_path.last == to
  end

  def king?
    chessman.is_a? King
  end
end
