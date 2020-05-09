# frozen_string_literal: true

# Service object that checks whether short castle is possible
class ShortCastlePossible
  include FieldService
  include CastlePossible

  private

  def king_path
    king.short_castle_path
  end

  def white_rook_field
    :H1
  end

  def black_rook_field
    :H8
  end

  def white_rook_path
    %i[G1 F1]
  end

  def black_rook_path
    %i[G8 F8]
  end
end
