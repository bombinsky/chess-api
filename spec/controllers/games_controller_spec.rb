# frozen_string_literal: true

describe GamesController do
  describe '#create' do
    let(:white_player) { create :user }
    let(:black_player) { create :user }
    let(:white_player_id) { white_player.id }
    let(:black_player_id) { black_player.id }
    let(:params) do
      {
        game:
          {
            white_player_id: white_player_id,
            black_player_id: black_player_id
          }
      }
    end

    include_context 'with all chessmen loaded'

    before do
      authenticate(white_player)

      post :create, params: params, as: :json
    end

    it_behaves_like 'successful response', :created

    it 'returns just created game with proper serializer' do
      expect(parsed_body_of_response).to serialize_object(Game.last).with(GameSerializer).using_root_key(:game)
    end

    context 'when any required param is blank' do
      let(:white_player_id) { nil }

      it_behaves_like 'not successful response', :not_found, "Couldn't find User without an ID"
    end

    context 'when any required user_id is wrong' do
      let(:black_player_id) { 999 }

      it_behaves_like 'not successful response', :not_found, "Couldn't find User with 'id'=999"
    end
  end
end
