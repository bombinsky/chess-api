# frozen_string_literal: true

# Service object that created a move in game
class CreateMove
  def initialize(game, from, to)
    @game = game
    @from = from
    @to = to
  end

  def call
    return new_move unless new_move.valid?

    # when new move looks valid move chessman can be called
    MoveChessman.new(game, from.to_sym, to.to_sym).call
  end

  private

  attr_reader :game, :from, :to

  delegate :board, to: :game
  delegate :chessman_at, to: :board

  def new_move
    @new_move ||= Move.new(game: game, from: from, to: to, chessman: chessman_at(from))
  end
end
