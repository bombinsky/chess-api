# frozen_string_literal: true

# Module with methods shared by services for movement in specific vector (movement)
module VectorService
  extend ActiveSupport::Concern

  def initialize(game, from, movement)
    @game = game
    @from = from
    @movement = movement
  end

  private

  attr_reader :game, :from, :movement

  delegate :board, to: :game
  delegate :chessman_at, to: :board

  def chessman
    @chessman ||= chessman_at(from)
  end

  def pass_to_final_field
    field = from
    movement.each do |movement_step|
      field = NextField.new(field, movement_step).call
      return nil unless field.present?
    end
    field
  end
end
