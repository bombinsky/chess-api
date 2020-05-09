# frozen_string_literal: true

describe PerformBeatingInPass do
  describe '#call' do
    subject(:service_call) { described_class.new(game, from, to).call }

    let(:game) { board.game }
    let(:from) { :C5 }
    let(:to) { :D6 }

    before { create :move, :black_pawn_first_move, game: game }

    context 'when beating in pass not causes check' do
      let(:board) { create :board, :white_beating_in_pass }

      it_behaves_like 'beating in pass'
      it_behaves_like 'not check maker'
    end

    context 'when beating in pass causes check' do
      let(:board) { create :board, :white_beating_in_pass_check }

      it_behaves_like 'beating in pass'
      it_behaves_like 'check maker'
    end

    context 'when capture' do
      let(:board) { create :board, :white_beating_in_pass }

      let(:move) { service_call }

      it 'saves taken_id' do
        expect(move.taken_id).to be_present
      end

      it 'saves taken_id different than chessman_id' do
        expect(move.taken_id).not_to eq move.chessman_id
      end

      it 'saves captured' do
        expect(move.captured).to be_present
      end

      it 'saves captured not eq to field to' do
        expect(move.captured).not_to eq move.to
      end

      it 'saves special_type' do
        expect(move).to be_beating_in_pass
      end
    end
  end
end
