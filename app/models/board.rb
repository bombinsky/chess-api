# frozen_string_literal: true

# Represents board
class Board < ApplicationRecord
  COLS = ('A'..'H').freeze
  ROWS = (1..8).freeze

  FIELDS = %i[
    A8 B8 C8 D8 E8 F8 G8 H8
    A7 B7 C7 D7 E7 F7 G7 H7
    A6 B6 C6 D6 E6 F6 G6 H6
    A5 B5 C5 D5 E5 F5 G5 H5
    A4 B4 C4 D4 E4 F4 G4 H4
    A3 B3 C3 D3 E3 F3 G3 H3
    A2 B2 C2 D2 E2 F2 G2 H2
    A1 B1 C1 D1 E1 F1 G1 H1
  ].freeze

  belongs_to :game

  FIELDS.each do |field|
    belongs_to field, class_name: 'Chessman', optional: true
  end

  validates_presence_of :game, on: :create

  def chessmen
    FIELDS.map do |field|
      chessman = public_send(field)
      { field => chessman } if chessman.present?
    end.compact
  end

  def white
    chessmen.select { |chessman| chessman.values.first.white? }
  end

  def black
    chessmen.select { |chessman| chessman.values.first.black? }
  end
end
