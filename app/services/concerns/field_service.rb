# frozen_string_literal: true

# Module with methods shared by services that uses board field as initial point
module FieldService
  extend ActiveSupport::Concern

  def initialize(game, field)
    @game = game
    @field = field
  end

  private

  attr_reader :game, :field

  delegate :board, to: :game

  def chessman
    @chessman ||= board.public_send field.to_sym
  end

  def special_movements_fields(movements)
    movements.reduce([]) do |res, movement|
      res + "#{ chessman.type }_#{ movement }_field".classify.constantize.public_send(:new, game, field).call.to_a
    end
  end
end
