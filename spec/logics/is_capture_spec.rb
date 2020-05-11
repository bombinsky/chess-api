# frozen_string_literal: true

describe IsCapture do
  describe '#call' do
    subject(:service_call) { described_class.new(game, attacker_position, attacked_position).call }

    let(:board) { build :board, :three_pawns }
    let(:game) { board.game }
    let(:empty_field) { :A4 }

    context 'when attacker is not present' do
      let(:attacker_position) { empty_field }
      let(:attacked_position) { empty_field }

      it { is_expected.to be_falsey }
    end

    context 'when attacked is not present' do
      let(:attacker_position) { :E4 }
      let(:attacked_position) { empty_field }

      it { is_expected.to be_falsey }
    end

    context 'when they are not opponents' do
      let(:attacker_position) { :E4 }
      let(:attacked_position) { :F5 }

      it { is_expected.to be_falsey }
    end

    context 'when they are opponents' do
      let(:attacker_position) { :E4 }
      let(:attacked_position) { :D5 }

      it { is_expected.to be_truthy }
    end
  end
end
