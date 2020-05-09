# frozen_string_literal: true

# Represents move
class Move < ApplicationRecord
  enum special_type: { castle: 1, beating_in_pass: 2, promotion: 3 }

  belongs_to :game
  belongs_to :chessman
  belongs_to :taken, class_name: 'Chessman', optional: true

  validates :to, presence: true
  validates :from, presence: true, unless: :promotion?

  def to_row
    to.last.to_i
  end

  def to_col
    to.first
  end
end
