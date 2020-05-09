# frozen_string_literal: true

describe FreeFields do
  describe '#call' do
    subject(:service_call) { described_class.new(game, field, movement).call }

    let(:game) { board.game }

    context 'when chessman movements are continuous' do
      let(:board) { build :board, :white_queen_vs_black_pawns }
      let(:field) { :E5 }
      let(:chessman) { board.E5 }
      let(:result) { [:G8] }

      Queen.new.movements.each do |m|
        context "delegates #{ m } to FreeFieldsOnPath" do
          let(:movement) { m }

          before { allow_service_call(FreeFieldsOnPath, with: [game, field, movement], to_return: result) }

          it { is_expected.to eq result }
        end
      end
    end

    context 'when chessman is one field slugger' do
      let(:board) { build :board, :three_pawns }
      let(:field) { :D5 }
      let(:chessman) { board.D5 }

      context 'when there is no free fields' do
        let(:movement) { :se }

        it { is_expected.to be_nil }
      end

      context 'when there is one free field' do
        let(:movement) { :sw }

        it { is_expected.to eq [:C4] }
      end
    end

    context 'when chessman jumping' do
      let(:board) { build :board, :white_knight_and_three_pawns }
      let(:field) { :E3 }
      let(:chessman) { board.E3 }

      context 'when field is occupied by opponent' do
        let(:movement) { %i[n ne] }

        it { is_expected.to be_nil }
      end

      context 'when field is occupied by ally' do
        let(:movement) { %i[w nw] }

        it { is_expected.to be_nil }
      end

      context 'when field is free' do
        let(:movement) { %i[s se] }

        it { is_expected.to be_an Array }
      end
    end
  end
end
