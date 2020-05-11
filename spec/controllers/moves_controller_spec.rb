# frozen_string_literal: true

describe MovesController do
  describe '#create' do
    let(:board) { create :board, :white_rook_protect_king }
    let(:game_id) { board.game.id }
    let(:from) { :A1 }
    let(:to) { :A7 }
    let(:params) do
      {
        move: { from: from, to: to },
        game_id: game_id
      }
    end

    before { post :create, params: params, as: :json }

    it_behaves_like 'successful response', :created

    it 'returns just create move with proper serializer' do
      expect(parsed_body_of_response).to serialize_object(Move.last).with(MoveSerializer).using_root_key(:move)
    end

    context 'when incorrect move' do
      let(:to) { :H8 }

      it_behaves_like 'not successful response', :unprocessable_entity, 'incorrect move', :move
    end

    context 'when incorrect game id' do
      let(:game_id) { 999 }

      it_behaves_like 'not successful response', :not_found, "Couldn't find Game with 'id'=999"
    end

    context 'when any required param is blank' do
      let(:from) { nil }

      it_behaves_like 'not successful response', :unprocessable_entity, "can't be blank", :from
    end
  end
end
