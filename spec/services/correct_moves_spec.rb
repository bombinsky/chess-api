# frozen_string_literal: true

describe CorrectMoves do
  describe '#call' do
    subject(:service_call) { described_class.new(game, field).call }

    let(:board) { build :board }
    let(:game) { board.game }
    let(:field) { :F8 }
    let(:available_captures) { %i[E4 F5 G7] }
    let(:available_moves) { %i[A1 F2 B2] }
    let(:available_special_moves) { [:C6] }
    let(:available_special_captures) { [:C7] }
    let(:expected_array) { available_captures + available_moves + available_special_moves + available_special_captures }

    before do
      allow_service_call(AvailableCaptures, with: [game, field], to_return: available_captures)
      allow_service_call(AvailableMoves, with: [game, field], to_return: available_moves)
      allow_service_call(AvailableSpecialMoves, with: [game, field], to_return: available_special_moves)
      allow_service_call(AvailableSpecialCaptures, with: [game, field], to_return: available_special_captures)
    end

    it { is_expected.to eq expected_array }
  end
end
