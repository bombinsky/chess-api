# frozen_string_literal: true

# Service object that detect position of a king
class KingField
  def initialize(game, color)
    @game = game
    @color = color.to_sym
  end

  def call
    position.keys.first
  end

  private

  attr_reader :game, :color

  delegate :board, to: :game

  def chessmen
    board.public_send color
  end

  def position
    @position = chessmen.find { |chessman| chessman.values.first.is_a? King }
  end
end
