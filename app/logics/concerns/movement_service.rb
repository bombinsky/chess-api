# frozen_string_literal: true

# Module with methods shared by services that performs regular movement
module MovementService
  extend ActiveSupport::Concern

  def initialize(game, from, to)
    @game = game
    @from = from.to_sym
    @to = to.to_sym
  end

  private

  attr_reader :game, :from, :to

  delegate :board, to: :game
  delegate :chessman_at, to: :board

  def chessman
    @chessman ||= chessman_at(from)
  end
end
