# frozen_string_literal: true

# Service object that detect if movement is a mate
class IsMate
  include ProbeService

  def initialize(game)
    @game = game
  end

  def call
    chessmen_positions.each do |position_of_chessman|
      @from = position_of_chessman.keys.first
      @chessman = position_of_chessman.values.first
      return false if any_chessman_move_not_causes_check?
    end
    true
  end

  private

  attr_reader :game, :from, :to, :chessman

  delegate :board, to: :game

  def chessmen_positions
    @chessmen_positions ||= board.public_send game.whose_round?
  end

  def any_chessman_move_not_causes_check?
    correct_chessman_moves.each do |to|
      return true unless try_to_protect_king_still_causes_check?(to)
    end
    false
  end

  def try_to_protect_king_still_causes_check?(to)
    @to = to
    move_chessman
    check?.tap { put_chessman_back }
  end

  def correct_chessman_moves
    CorrectMoves.new(game, from).call
  end
end
