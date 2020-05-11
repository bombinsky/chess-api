# frozen_string_literal: true

describe CapturedField do
  describe '#call' do
    subject(:service_call) { described_class.new(game, field, movement).call }

    let(:game) { board.game }

    context 'when chessman movements are continuous' do
      let(:board) { build :board, :white_queen_vs_black_pawns }
      let(:field) { :E5 }
      let(:chessman) { board.E5 }
      let(:result) { :G8 }

      Queen.new.movements.each do |m|
        context "delegates #{ m } to CapturedFieldFirstOnPath" do
          let(:movement) { m }

          before { allow_service_call(CapturedFieldFirstOnPath, with: [game, field, movement], to_return: result) }

          it { is_expected.to eq result }
        end
      end
    end

    context 'when chessman is one field slugger' do
      let(:board) { build :board, :three_pawns }
      let(:field) { :E4 }
      let(:chessman) { board.E4 }
      let(:opponent_position) { :D5 }

      context 'when opponent exists' do
        let(:movement) { :nw }

        it { is_expected.to eq opponent_position }
      end

      context 'when opponent does not exists' do
        let(:movement) { :ne }

        it { is_expected.to be_nil }
      end
    end

    context 'when chessman jumping' do
      let(:board) { build :board, :white_knight_and_three_pawns }
      let(:field) { :E3 }
      let(:chessman) { board.E3 }
      let(:opponent_position) { :F5 }

      context 'when opponent exists' do
        let(:movement) { %i[n ne] }

        it { is_expected.to eq opponent_position }
      end

      context 'when opponent does not exists' do
        let(:movement) { %i[w nw] }

        it { is_expected.to be_nil }
      end
    end
  end
end
