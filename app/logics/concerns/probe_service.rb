# frozen_string_literal: true

# Module with methods shred by services that have to probe move
module ProbeService
  extend ActiveSupport::Concern

  private

  attr_reader :taken

  def move_chessman
    memorize_taken
    board.put_at(to, chessman)
    board.clear_at(from)
  end

  def put_chessman_back
    board.put_at(to, taken)
    board.put_at(from, chessman)
  end

  def memorize_taken
    @taken = board.chessman_at(to) if to.present?
  end

  def king_field
    KingField.new(game, chessman.color).call
  end

  def check?
    IsCheck.new(game, king_field).call
  end
end
