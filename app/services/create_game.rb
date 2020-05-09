# frozen_string_literal: true

# Service object that created a game
class CreateGame
  def initialize(creator:, white_player:, black_player:)
    @creator = creator
    @white_player = white_player
    @black_player = black_player
  end

  def call
    initialize_game.tap do
      setup_chessmen
      game.save!
    end
    game
  end

  private

  attr_reader :creator, :white_player, :black_player, :game

  def initialize_game
    @game = Game.new new_game_attributes
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
    [1, 2, 7, 8].each { |no| setup_row no }
  end

  def setup_row(row_number)
    Board::COLS.each do |col|
      game.board.public_send "#{ col }#{ row_number }_id=".to_sym, chessmen.shift.id
    end
  end

  def chessmen
    @chessmen ||= Chessman.all.to_a
  end
end
