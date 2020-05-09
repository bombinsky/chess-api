# frozen_string_literal: true

# Module with methods shred by services that have to probe move
module ProbeService
  extend ActiveSupport::Concern

  private

  attr_reader :taken_id

  def move_chessman
    memorize_taken_id
    board.public_send foreign_key_to_setter, chessman.id
    board.public_send foreign_key_from_setter, nil
  end

  def put_chessman_back
    board.public_send foreign_key_to_setter, taken_id
    board.public_send foreign_key_from_setter, chessman.id
  end

  def memorize_taken_id
    @taken_id = nil
    @taken_id = board.public_send(foreign_key_to_getter) if to.present?
  end

  def foreign_key_from_setter
    "#{ from }_id=".to_sym
  end

  def foreign_key_to_setter
    "#{ to }_id=".to_sym
  end

  def foreign_key_to_getter
    "#{ to }_id".to_sym
  end

  def king_field
    KingField.new(game, chessman.color).call
  end

  def check?
    IsCheck.new(game, king_field).call
  end
end
