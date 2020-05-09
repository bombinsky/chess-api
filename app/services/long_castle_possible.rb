# frozen_string_literal: true

# Service object that determine what should be the field to make long castle
class LongCastlePossible
  include FieldService
  include CastlePossible

  private

  def king_path
    king.long_castle_path
  end

  def white_rook_field
    :A1
  end

  def black_rook_field
    :A8
  end

  def white_rook_path
    %i[B1 C1 D1]
  end

  def black_rook_path
    %i[B8 C8 D8]
  end
end
