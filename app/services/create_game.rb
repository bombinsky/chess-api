# frozen_string_literal: true

# Service object that created a game
class CreateGame
  def initialize(creator:, white_player:, black_player:)
    @creator = creator
    @white_player = white_player
    @black_player = black_player
  end

  def call
    game.tap do |game|
      setup_chessmen
      game.save!
    end
  end

  private

  attr_reader :creator, :white_player, :black_player

  delegate :first, :last, to: Board::ROWS
  delegate :board, to: :game

  def game
    @game ||= Game.new(new_game_attributes)
  end

  def new_game_attributes
    {
      creator: creator,
      white_player: white_player,
      black_player: black_player,
      board: Board.new
    }
  end

  def setup_chessmen
    [first, first.next, last.pred, last].each { |number| setup_row(number) }
  end

  def setup_row(row_number)
    Board::COLS.each { |col_number| board.put_at("#{ col_number }#{ row_number }", chessmen.shift) }
  end

  def chessmen
    @chessmen ||= Chessman.all.to_a
  end
end
