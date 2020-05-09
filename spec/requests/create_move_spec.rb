# frozen_string_literal: true

describe 'Create move' do
  let(:board) { create :board, :white_rook_protect_king }
  let(:from) { 'A1' }
  let(:to) { 'A7' }
  let(:parsed_body_of_response) { JSON.parse(response.body) }

  describe '#create' do
    context 'when requests is proper' do
      before do
        post game_moves_path(game_id: board.game.id), params: { move: { from: from, to: to } }, as: :json
      end

      it 'responds with status code 201' do
        expect(response.code).to eq '201'
      end

      it 'responds with proper content type' do
        expect(response.content_type).to eq 'application/json; charset=utf-8'
      end

      it 'returns just create move with proper serializer' do
        expect(parsed_body_of_response).to serialize_object(Move.last).with(MoveSerializer).using_root_key(:move)
      end
    end
  end
end
