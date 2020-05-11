# frozen_string_literal: true

describe PerformMove do
  describe '#call' do
    subject(:service_call) { described_class.new(game, from, to).call }

    let(:board) { create :board, :white_rook_protect_king }
    let(:game) { board.game }
    let(:from) { :B2 }
    let(:to) { :B4 }

    it 'changes previous field to nil' do
      expect { service_call }.to change(board, :B2).to nil
    end

    it 'changes target field as new position' do
      expect { service_call }.to change(board, :B4)
    end

    it 'saves move in game history' do
      expect { service_call }.to change(Move, :count).by 1
    end

    it 'does not save taken_id' do
      expect(service_call.taken_id).to be_nil
    end

    it 'does not saves captured' do
      expect(service_call.captured).to be_nil
    end

    it 'saves last move as check' do
      service_call

      expect(Move.last.check).to be_truthy
    end

    context 'when capture' do
      let(:from) { :A1 }
      let(:to) { :A7 }

      it 'saves taken_id' do
        expect(service_call.taken_id).to be_present
      end

      it 'saves taken_id different than chessman_id' do
        expect(service_call.taken_id).not_to eq service_call.chessman_id
      end

      it 'saves captured' do
        expect(service_call.captured).to be_present
      end

      it 'saves captured eq to field to' do
        expect(service_call.captured).to eq service_call.to
      end
    end
  end
end
