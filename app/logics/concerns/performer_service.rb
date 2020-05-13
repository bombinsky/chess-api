# frozen_string_literal: true

# Module with methods required by all services that performs move
module PerformerService
  extend ActiveSupport::Concern

  def call
    set_taken # memorise taken
    Board.transaction do
      update_board
      create_history
    end
    game.moves.last # move have to be returned
  end

  private

  attr_reader :taken

  def check?
    IsCheck.new(game, opponent_king_field).call
  end

  def opponent_king_field
    KingField.new(game, chessman.opponent_color).call
  end
end
