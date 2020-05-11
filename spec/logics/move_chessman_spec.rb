# frozen_string_literal: true

describe MoveChessman do
  describe '#call' do
    subject(:service_call) { described_class.new(game, from, to).call }

    let(:board) { create :board, :white_rook_protect_king }
    let(:game) { board.game }

    context 'when beating in pass is possible' do
      let(:from) { :C5 }
      let(:to) { :D6 }
      let(:board) { create :board, :white_beating_in_pass }
      let(:last_move) { build :move, :black_pawn_first_move }

      before do
        allow(game).to receive(:last_move).and_return last_move
      end

      it 'calls PerformBeatingInPass' do
        expect(PerformBeatingInPass).to receive_call.with(game, from, to)

        service_call
      end
    end

    context 'when long castle is possible' do
      let(:from) { :E1 }
      let(:to) { :C1 }
      let(:board) { create :board, :white_king_long_castle_possible }

      it 'calls PerformCastle' do
        expect(PerformCastle).to receive_call.with(game, from, to)

        service_call
      end
    end

    context 'when long castle is not possible' do
      let(:from) { :E8 }
      let(:to) { :C8 }
      let(:board) { create :board, :white_rook_castle_path_not_clear }

      it_behaves_like 'wrong move', 'no chessman in field'
    end

    context 'when chessman not present on from field' do
      let(:from) { :A4 }
      let(:to) { :D8 }

      it_behaves_like 'wrong move', 'no chessman in field'
    end

    context 'when field to is not in available moves' do
      let(:from) { :B2 }
      let(:to) { :H8 }

      it_behaves_like 'wrong move', 'incorrect move'
    end

    context 'when field from protects king' do
      let(:from) { :D4 }
      let(:to) { :D8 }

      it_behaves_like 'wrong move', 'check'
    end

    context 'when move is correct' do
      let(:from) { :B2 }
      let(:to) { :B4 }

      it 'calls perform move' do
        expect(PerformMove).to receive_call.with(game, from, to)

        service_call
      end
    end

    context 'when beating in pass causes check and mate' do
      let(:from) { :C5 }
      let(:to) { :D6 }
      let!(:game) { create :game }
      let!(:last_move) { create :move, :black_pawn_first_move, game: game }
      let!(:board) do
        create :board, :white_beating_in_pass_check_mate, game: game
      end

      it 'saves mate' do
        expect { service_call }.to change(game, :mate?)
      end
    end

    context 'when promotion with mate' do
      let(:from) { :C7 }
      let(:to) { :B8 }
      let(:game) { create :game, board: board }
      let(:board) { create :board, :white_promotion_with_mate }
      let(:last_move) { create :move, :black_pawn_first_move, game: game }

      before { create :white_queen }

      it 'promotes pawn to queen' do
        service_call

        expect(game.board.B8).to be_a Queen
      end

      it 'promotes pawn to white queen' do
        service_call

        expect(game.board.B8).to be_white
      end

      it 'saves does not save check status' do
        expect { service_call }.to change(game, :mate?)
      end
    end

    context 'when white move causes black stalemate' do
      let(:from) { :G6 }
      let(:to) { :G5 }
      let(:board) { create :board, :black_stalemate }
      let(:game) { create :game, board: board }

      it 'saves stalemate' do
        expect { service_call }.to change(game, :stalemate?)
      end
    end
  end
end
