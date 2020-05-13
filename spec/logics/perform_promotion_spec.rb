# frozen_string_literal: true

describe PerformPromotion do
  describe '#call' do
    subject(:service_call) { described_class.new(game, from, to).call }

    let(:game) { board.game }

    context 'when promotion not causes check' do
      let(:board) { create :board, :white_promotion_without_mate }
      let(:from) { :C7 }
      let(:to) { :C8 }

      it 'does not save taken' do
        expect(service_call.taken).to be_nil
      end

      it 'does not save captured' do
        expect(service_call.captured).to be_nil
      end

      it_behaves_like 'not check maker'

      it 'promotes to Queen' do
        expect(service_call.chessman.class).to be Queen
      end

      it_behaves_like 'special moves saver', :promotion, 2
    end

    context 'when promotion causes check' do
      let(:board) { build :board, :white_promotion_with_mate }
      let(:from) { :C7 }
      let(:to) { :C8 }

      it_behaves_like 'check maker'
    end

    context 'when capture' do
      let(:board) { create :board, :white_promotion_with_mate }
      let(:from) { :C7 }
      let(:to) { :B8 }

      it 'saves taken' do
        expect(service_call.taken).to be_present
      end

      it 'saves taken different than chessman' do
        expect(service_call.taken).not_to eq service_call.chessman
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
