# frozen_string_literal: true

describe PerformCastle do
  describe '#call' do
    subject(:service_call) { described_class.new(game, from, to).call }

    let(:from) { :E1 }
    let(:to) { :C1 }
    let(:game) { board.game }

    context 'when castle not causes check' do
      let(:board) { create :board, :white_king_long_castle_possible }

      it_behaves_like 'castle'

      it_behaves_like 'not check maker'
    end

    context 'when castle causes check' do
      let(:board) { create :board, :white_king_long_castle_possible_check }

      it_behaves_like 'castle'
      it_behaves_like 'check maker'
    end
  end
end
