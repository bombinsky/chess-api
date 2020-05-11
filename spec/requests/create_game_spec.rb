# frozen_string_literal: true

describe 'Create game' do
  let(:white_player) { create :user }
  let(:black_player) { create :user }
  let(:creator) { white_player }

  let(:params) do
    {
      game:
        {
          white_player_id: white_player.id,
          black_player_id: black_player.id
        }
    }
  end

  include_context 'with all chessmen loaded'

  before do
    authenticate(creator)

    post games_path, params: params, as: :json
  end

  it 'responds with status code 201' do
    expect(response.code).to eq '201'
  end

  it 'returns just create game with proper serializer' do
    expect(parsed_body_of_response).to serialize_object(Game.last).with(GameSerializer).using_root_key(:game)
  end
end
