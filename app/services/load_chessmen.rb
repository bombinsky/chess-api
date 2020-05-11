# frozen_string_literal: true

# Service object that loaded chessmen to the system
class LoadChessmen
  def call
    reload_chessmen unless loaded?
  end

  private

  def loaded?
    Chessman.count == 32 && Chessman.first.id == 1 && Chessman.last.id == 32
  end

  def reload_chessmen
    Chessman.transaction do
      Chessman.destroy_all
      Chessman.connection.execute 'ALTER SEQUENCE chessmen_id_seq RESTART WITH 1'
      load_chessmen Chessman::WHITE
      load_chessmen Chessman::BLACK
    end
  end

  def load_chessmen(color)
    create_row_of_black_pawns if color == Chessman::BLACK
    load_left_figures(color)
    load_right_figures(color)
    create_row_of_white_pawns if color == Chessman::WHITE
  end

  def create_row_of_black_pawns
    8.times { create_chessman(Pawn, Chessman::BLACK) }
  end

  def create_row_of_white_pawns
    8.times { create_chessman(Pawn, Chessman::WHITE) }
  end

  def load_left_figures(color)
    create_chessman(Rook, color)
    create_chessman(Knight, color)
    create_chessman(Bishop, color)
    create_chessman(Queen, color)
  end

  def load_right_figures(color)
    create_chessman(King, color)
    create_chessman(Bishop, color)
    create_chessman(Knight, color)
    create_chessman(Rook, color)
  end

  def create_chessman(klass, color)
    klass.create!(color: color, symbol: Chessman::SYMBOLS[color.to_sym][klass.name.to_sym])
  end
end
