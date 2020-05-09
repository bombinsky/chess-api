# frozen_string_literal: true

# Service object that draws board in console just for debugging purposes
class DrawBoard
  BACKGROUNDS = %i[light_black white].freeze

  CHESSMEN = {
    white: { king: '♔', queen: '♕', rook: '♖', bishop: '♗', knight: '♘', pawn: '♙' },
    black: { king: '♚', queen: '♛', rook: '♜', bishop: '♝', knight: '♞', pawn: '♟' }
  }.freeze

  def initialize(board)
    @board = board
  end

  def call
    system 'clear' if console?
    logger.level = 1
    draw_board
    logger.level = 0
    nil
  end

  private

  attr_reader :board, :row_index, :col_index

  delegate :game, to: :board

  delegate :logger, to: ActiveRecord::Base

  def console?
    defined?(Rails::Console)
  end

  def draw_board
    print "\n"
    draw_rows
    draw_alphabet
    draw_history if console?
  end

  def draw_rows
    (0..7).to_a.reverse.each do |row_index|
      @row_index = row_index
      print " #{ 8 - row_index } "
      draw_cols
      print "\n"
    end
  end

  def draw_cols
    (0..7).each do |col_index|
      @col_index = col_index
      print " #{ content } ".send(color).send("on_#{ background }".to_sym)
    end
  end

  def draw_alphabet
    puts "    #{ Board::COLS.to_a.join('  ') } "
  end

  def color
    chessman.present? && chessman.white? ? 'light_white'.to_sym : 'black'.to_sym
  end

  def content
    chessman.present? ? chessman_chr + '' : ' '
  end

  def chessman_chr
    CHESSMEN[chessman.color.to_sym][chessman.type.underscore.to_sym]
  end

  def chessman
    board.public_send "#{ Board::COLS.to_a[col_index] }#{ Board::ROWS.to_a[row_index] }".to_sym
  end

  def background
    BACKGROUNDS[(col_index % 2 - (row_index % 2 - 1).abs).abs]
  end

  def draw_history
    puts "\nGame record"
    print_moves
    puts "\n"
  end

  def print_moves
    board.game.moves.each_with_index do |move, index|
      print_move(move, move.chessman, index)
    end
  end

  def print_move(move, chessman, index)
    print "#{ index + 1 }) #{ move.created_at.to_s(:db) } : "
    print "#{ chessman.color.capitalize } #{ chessman.class } : "
    print "#{ move.from } -> #{ move.to }\n"
  end
end
