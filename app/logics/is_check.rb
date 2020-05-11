# frozen_string_literal: true

# Service object that detect if movement is a check
class IsCheck
  include FieldService

  def call
    opponents_captures.include? field
  end

  private

  def opponents_captures
    captures = []
    opponents.each do |opponent|
      captures += AvailableCaptures.new(game, opponent.keys.first).call
    end
    captures.uniq
  end

  def opponents
    @opponents ||= board.opponents(chessman.color)
  end
end
