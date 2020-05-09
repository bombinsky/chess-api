# frozen_string_literal: true

describe MovesController do
  let(:board) { create :board, :white_rook_protect_king }
  let(:game_id) { board.game.id }
  let(:params) { { move: { from: from, to: to }, game_id: game_id } }
  let(:parsed_body_of_response) { JSON.parse(response.body) }
  let(:from) { :A1 }
  let(:to) { :A7 }

  describe '#create' do
    before { post :create, params: params, as: :json }

    context 'when correct move' do
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

    context 'when incorrect move' do
      let(:to) { :H8 }

      it { is_expected.to respond_with :unprocessable_entity }

      it 'returns errors including incorrect move info' do
        expect(parsed_body_of_response['errors']).to include 'incorrect move'
      end
    end

    context 'when incorrect game id' do
      let(:game_id) { 987_654 }

      it { is_expected.to respond_with :not_found }

      it 'returns errors including info about not found game' do
        expect(parsed_body_of_response['errors'].first).to include "Couldn't find Game with 'id'=#{ game_id }"
      end
    end

    context 'when any required param is blank' do
      let(:from) { nil }

      it { is_expected.to respond_with :unprocessable_entity }

      it 'returns info about missing param' do
        expect(parsed_body_of_response['errors']).to include 'param is missing or the value is empty: from'
      end
    end
  end
end
